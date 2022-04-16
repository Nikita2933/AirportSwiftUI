//
//  WeatherFlow.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                weatherTop()
                weatherList(dataModel: viewModel.exampleWeather)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolbarMenu()
                }
            }
            .navigationTitle(LocalizableStrings.Weather.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct weatherTop: View {
    var body: some View {
        VStack{
            HStack {
                Text("янв. 27. 11:47 AM")
                Spacer()
            }
            HStack {
                Text("-9")
                    .font(.system(size: 40))
                Spacer()
                Image(uiImage: Resources.Images._01d.image)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .trailing)
            }
            HStack {
                Text("Небольшой снегопад")
                Spacer()
            }
            HStack {
                Text("Ветер 2 м/с")
                Spacer()
            }
            Divider()
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}

struct weatherList: View {
    let dataModel: [WeatherCellModel]
    var body: some View {
        List {
            ForEach(dataModel, id: \.self) { item in
                weatherListCell(model: item)
                Divider()
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct weatherListCell: View {
    let model: WeatherCellModel
    var body: some View {
        VStack {
            HStack {
                Text(model.time)
                Spacer()
                Image(uiImage: model.weatherIcon)
                    .resizable()
                    .frame(width: 60, height: 60)
                Spacer()
                Text(model.temperature)
                Text(model.windSpeed)
            }
        }
    }
}

struct weather_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
