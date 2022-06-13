//
//  WeatherFlow.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import Domain
import SwiftUI
import Resolver
import CoreAirport

struct WeatherView: View {
    @StateObject var viewModel: WeatherViewModel = Resolver.resolve()
    
    var body: some View {
        NavigationView {
            if let model = viewModel.exampleWeather, let current = model.current, let hourly = model.hourly {
                VStack {
                    List {
                        Section {
                            ForEach(hourly, id: \.self) { item in
                                weatherListCell(model: item)
                                Divider()
                            }
                            .listRowSeparator(.hidden)
                        } header: {
                            weatherTop(model: current)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await viewModel.loadWeather()
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            ToolbarMenu()
                        }
                    }
                    .navigationTitle(LocalizableStrings.Weather.title)
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                WeatherEmptyState()
                    .listRowSeparator(.hidden)
            }
        }
    }
}

struct weatherTop: View {
    var model: CurrentData
    var body: some View {
            VStack {
                HStack {
                    Text(model.dt.toWeatherDate())
                    Spacer()
                }
                HStack {
                    Text(LocalizableStrings.Weather.temp(model.temp))
                        .font(.system(size: 40))
                    Spacer()
                    Image(uiImage: Resources.Images._01d.image)
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .trailing)
                }
                HStack {
                    Text(model.weather?.weatherDescription ?? "")
                    Spacer()
                }
                HStack {
                    Text(LocalizableStrings.Weather.windSpeed(model.windSpeed))
                    Spacer()
                }
                Divider()
            }
            .foregroundColor(.black)
            .listRowSeparator(.hidden)
    }
}

struct weatherListCell: View {
    let model: CurrentData
    var body: some View {
        VStack {
            HStack {
                Text(model.dt.toWeatherHourMinute())
                Spacer()
                Image(model.weather!.icon)
                    .resizable()
                    .frame(width: 60, height: 60)
                Spacer()
                Text(LocalizableStrings.Weather.temp(model.temp))
                Text(LocalizableStrings.Weather.windSpeed(model.windSpeed))
            }
        }
    }
}

struct weather_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
