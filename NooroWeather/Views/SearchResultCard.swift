//
//  SearchResultCard.swift
//  NooroWeather
//
//  Created by Ralph Etienne on 12/24/24.
//

import SwiftUI

struct SearchResultCard: View {
    let city: String
    let temperature: Int
    let weatherIcon: String

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(city)
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .padding(.top, 10)
                    HStack {
                        Text("\(temperature)")
                            .font(.custom("Poppins-Medium", size: 60))
                        Text("°")
                            .font(.custom("Poppins-SemiBold", size: 24))
                            .fontWeight(.regular)
                            .baselineOffset(30)
                    }
                }
                .frame(height: 130)

                Spacer()
                
                if let url = URL(string: "https:\(weatherIcon)") {
                    CustomImageView(size: 100, url: url)
                }
            }
            .padding(.horizontal, 30)
            .background(Color(.systemGray6))
            .cornerRadius(16)
            
            Spacer()
        }
    }
}

#Preview {
    SearchResultCard(city: "Miami", temperature: 75, weatherIcon: "https://cdn.weatherapi.com/weather/64x64/night/119.png")
}
