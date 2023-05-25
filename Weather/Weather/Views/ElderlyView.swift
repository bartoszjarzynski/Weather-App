//
//  ElderlyView.swift
//  Weather
//
//  Created by Magdalena Maloszyc on 21/03/2023.
//

import SwiftUI

struct ElderlyView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .center, spacing: 10) {
                    Text("Today, \(Date().formatted(.dateTime.month().day()))")
                        .fontWeight(.light).font(.system(size:25))
                    
                    Text(weather.name)
                        .bold().font(.system(size:40))
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(20)
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 10) {
                            Image(systemName: "cloud.fill")
                                .font(.system(size:70))
                            
                            Text(weather.weather[0].main) .font(.system(size:30))
                        }
                        .frame(width: 150, alignment: .center)
                        
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size:130))
                            .fontWeight(.bold)
                            .padding(0)
                    }
                    .padding(.top, 50)
                    
                    
                    Button ("Click here to get back", action: {
                        //WeatherView(weather: weather)
                    })
                    .bold().font(.system(size: 30))
                    
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        
            VStack {
                Spacer()
                VStack (alignment: .center, spacing: 50){
                    HStack {
                        WeatherElderlyRow(logo: "thermometer.low", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherElderlyRow(logo: "thermometer.high", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherElderlyRow(logo: "aqi.medium", name: "Pressure", value: (weather.main.pressure.roundDouble() + "hPa"))
                        Spacer()
                        WeatherElderlyRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    HStack {
                        WeatherElderlyRow(logo: "sunrise", name: "Sunrise", value: timeConverter(weather.sys.sunrise, format: "HH:mm"))
                        Spacer()
                        WeatherElderlyRow(logo: "sunset", name: "Sunrise", value: timeConverter(weather.sys.sunset, format: "HH:mm"))
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

struct ElderlyView_Previews: PreviewProvider {
    static var previews: some View {
        ElderlyView(weather: previewWeather)
    }
}
