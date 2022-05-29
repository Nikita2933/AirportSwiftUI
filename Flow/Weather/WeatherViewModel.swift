//
//  WeatherViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import Foundation
import Domain
import Resolver

final class WeatherViewModel: ObservableObject {

    private var weatherRepository: WeatherRepository

    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }

    @Published public var loading: Bool = false

    @Published public var exampleWeather: RealmWeather?
}
