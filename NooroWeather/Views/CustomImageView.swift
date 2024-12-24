//
//  CustomImageView.swift
//  NooroWeather
//
//  Created by Ralph Etienne on 12/24/24.
//


import SwiftUI

struct CustomImageView: View {
    let size: Double
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { phase in
           switch phase {
           case .empty:
               ProgressView()
           case .success(let image):
               image
                   .resizable()
                   .scaledToFit()
                   .frame(width: size, height: size)
                   .clipped()
           case .failure:
               Text("Failed to load image")
           @unknown default:
               EmptyView()
           }
       }
    }
}
