//
//  SearchBar.swift
//  NooroWeather
//
//  Created by Ralph Etienne on 12/24/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var query: String
    var onSearch: () -> Void

    var body: some View {
        HStack {
            TextField("Search Location", text: $query)
                .font(.custom("Poppins-Regular", size: 16))
                .padding(.leading, 16)
                .frame(height: 50)
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: onSearch) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.trailing, 16)
                        }
                    }
                )
                .onSubmit {
                    // Trigger the search action when Enter is pressed
                    onSearch()
                }
        }
        .padding()
    }
}
