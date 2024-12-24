//
//  WeatherCardView.swift
//  NooroWeather
//
//  Created by Ralph Etienne on 12/24/24.
//

import SwiftUI

struct WeatherCardView: View {
    let city: String
    let temperature: Int
    let weatherIcon: String
    let humidity: Int
    let uv: Int
    let feelsLike: Int

    var body: some View {
        VStack(spacing: 0) {
            // Weather icon
            if let url = URL(string: "https:\(weatherIcon)") {
                CustomImageView(size: 120, url: url)
            }
            
            // City name
            HStack {
                Text(city)
                    .font(.custom("Poppins-SemiBold", size: 30))
                    .bold()
                Image("arrowCity")
                    .resizable()
                    .frame(width: 21, height: 21)
            }
            
            // Temperature
            HStack(spacing: 8) {
                Text("\(temperature)")
                    .font(.custom("Poppins-SemiBold", size: 70))
                    .bold()
                Text("°")
                    .font(.custom("Poppins-SemiBold", size: 30))
                    .fontWeight(.regular)
                    .baselineOffset(50)
            }
            .padding(.bottom, 16)
            
            // Weather info: Humidity, UV, and Feels like
            HStack(spacing: 70) {
                VStack(spacing: 8) {
                    Text("Humidity")
                        .font(.custom("Poppins-Light", size: 12))
                    Text("\(humidity)%")
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .bold()
                }
                
                VStack(spacing: 8) {
                    Text("UV")
                        .font(.custom("Poppins-Light", size: 12))
                    Text("\(uv)")
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .bold()
                }
                
                VStack(spacing: 8) {
                    Text("Feels Like")
                        .font(.custom("Poppins-Light", size: 8))
                        
                    Text("\(feelsLike)°")
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .bold()
                }
                
            }
            .multilineTextAlignment(.center)
            .padding(16)
            .foregroundColor(.gray)
            .background(Color(.systemGray6))
            .cornerRadius(16)
        }
        .padding()
    }
}

#Preview {
    WeatherCardView(city: "Miami", temperature: 80, weatherIcon: "https://cdn.weatherapi.com/weather/64x64/night/119.png", humidity: 20, uv: 6, feelsLike: 85)
}
