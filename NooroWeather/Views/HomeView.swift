//
//  ContentView.swift
//  NooroWeather
//
//  Created by Ralph Etienne on 12/24/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchQuery = ""
    @State private var isSearching = false
    @State private var isSaved = false
    @State private var selectedCity: String?
    @State private var localStorage = LocalStorage()
    @StateObject private var viewModel = WeatherViewModel()
    
    init() {
        // Load the saved city from UserDefaults if available
        if let savedCity = localStorage.getSavedCity() {
            _selectedCity = State(initialValue: savedCity)
        }
    }
    
    var body: some View {
        VStack(spacing: 40) {
            SearchBar(query: $searchQuery, onSearch: {
                // Save the selected city to LocalStorage
                localStorage.saveCity(searchQuery)
                selectedCity = searchQuery
                isSearching = true
                viewModel.fetchWeather(for: searchQuery)
            })

            if isSearching {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let city = selectedCity, let weather = viewModel.weatherData {
                    SearchResultCard(city: city,
                                     temperature: Int(weather.current.tempF),
                                     weatherIcon: weather.current.condition.icon
                    )
                }
            } else {
                if isSaved {
                    if let city = selectedCity, let weather = viewModel.weatherData {
                        WeatherCardView(
                            city: city,
                            temperature: Int(weather.current.tempF),
                            weatherIcon: weather.current.condition.icon,
                            humidity: weather.current.humidity,
                            uv: weather.current.uv,
                            feelsLike: Int(weather.current.feelslikeF)
                        )
                    }
                } else {
                    EmptyStateView()
                }
            }

            Spacer()
        }
        .padding()
        .task {
            // Fetch weather data if a city was saved
            if let city = selectedCity {
                isSaved = true
                DispatchQueue.main.async {
                    viewModel.fetchWeather(for: city)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
