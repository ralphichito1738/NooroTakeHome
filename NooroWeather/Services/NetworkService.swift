//
//  NetworkService.swift
//  NooroWeather
//
//  Created by Ralph Etienne on 12/24/24.
//


import Foundation
import Combine

protocol NetworkService {
    func fetchData(from url: URL) -> AnyPublisher<Data, URLError>
}

// Extend URLSession to conform to this protocol by using dataTaskPublisher
extension URLSession: NetworkService {
    func fetchData(from url: URL) -> AnyPublisher<Data, URLError> {
        return self.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
