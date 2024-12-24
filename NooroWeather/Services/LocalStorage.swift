//
//  LocalStorage.swift
//  NooroWeather
//
//  Created by Ralph Etienne on 12/24/24.
//

import Foundation

class LocalStorage {
    private let cityKey = "savedCity"

    func saveCity(_ city: String) {
        UserDefaults.standard.set(city, forKey: cityKey)
    }

    func getSavedCity() -> String? {
        UserDefaults.standard.string(forKey: cityKey)
    }
}
