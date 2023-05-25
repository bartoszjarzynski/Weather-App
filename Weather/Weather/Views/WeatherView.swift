//
//  WeatherView.swift
//  Weather
//
//  Created by Magdalena Maloszyc on 21/03/2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody

    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .center, spacing: 10) {
                    Text("Today, \(Date().formatted(.dateTime.month().day()))")
                        .fontWeight(.light)
                    
                    Text(weather.name)
                        .bold().font(.title)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(10)
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud.fill")
                                .font(.system(size:40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 100, alignment: .center)
                        
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size:100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    NavigationLink(destination: ElderlyView(weather: weather)) {
                        Text("For eldery view click here.")
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        
            VStack {
                Spacer()
                VStack (alignment: .center, spacing: 20){
                   Text("Weather now")
                        .bold().padding(.leading)
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "aqi.medium", name: "Pressure", value: (weather.main.pressure.roundDouble() + "hPa"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    HStack {
                        WeatherRow(logo: "sunrise", name: "Sunrise", value: timeConverter(weather.sys.sunrise, format: "HH:mm"))
                        Spacer()
                        WeatherRow(logo: "sunset", name: "Sunrise", value: timeConverter(weather.sys.sunset, format: "HH:mm"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.364, saturation: 0.448, brightness: 0.256))
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.364, saturation: 0.448, brightness: 0.256))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
