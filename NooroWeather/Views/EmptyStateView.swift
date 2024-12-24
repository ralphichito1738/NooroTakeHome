//
//  EmptyStateView.swift
//  NooroWeather
//
//  Created by Ralph Etienne on 12/24/24.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 15) {
                Text("No City Selected")
                    .font(.custom("Poppins-SemiBold", size: 30))
                    .bold()

                Text("Please Search For A City")
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    EmptyStateView()
}
