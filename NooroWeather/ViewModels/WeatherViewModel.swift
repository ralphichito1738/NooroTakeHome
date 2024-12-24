//
//  WeatherViewModel.swift
//  NooroWeather
//
//  Created by Ralph Etienne on 12/24/24.
//


import Combine
import SwiftUI

enum NetworkError: Error {
    case notConnectedToInternet
    case other(Error)
}

protocol WeatherViewModelProtocol: ObservableObject {
    var weatherData: WeatherData? { get set }
    var errorMessage: String? { get set }
    var isLoading: Bool { get set }
    
    func fetchWeather(for city: String)
}

class WeatherViewModel: WeatherViewModelProtocol {
    @Published var weatherData: WeatherData?
    @Published var errorMessage: String?
    @Published var isLoading = false
    private let networkService: NetworkService
    private var cancellables = Set<AnyCancellable>()
    private let apiKey = "6f2874ff04ef46dd81374538242412"
    private let baseURL = "https://api.weatherapi.com/v1/current.json"
    
    // Updated initializer with dependency injection
    init(networkService: NetworkService = URLSession.shared) {
        self.networkService = networkService
    }
    
    func fetchWeather(for city: String) {
        guard !city.isEmpty else { return }
        isLoading = true
        errorMessage = nil

        let urlString = "\(baseURL)?key=\(apiKey)&q=\(city)"
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            self.isLoading = false
            return
        }

        networkService.fetchData(from: url)
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { weatherData in
                self.weatherData = weatherData
                
            })
            .store(in: &cancellables)
    }
}
