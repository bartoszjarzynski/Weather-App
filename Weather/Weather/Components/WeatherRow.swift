//
//  WeatherRow.swift
//  Weather
//
//  Created by Magdalena Maloszyc on 03/04/2023.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack (spacing: 15) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 10, height: 20)
                .padding()
                .background(Color(.white))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
