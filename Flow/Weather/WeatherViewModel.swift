//
//  WeatherViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import Foundation
import Domain
import Resolver
import CoreAirport

final class WeatherViewModel: ObservableObject {

    private var weatherRepository: WeatherRepository

    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
        
        Task {
            await loadWeather()
        }
    }

    @Published public var loading: Bool = false

    @Published public var exampleWeather: RealmWeather?
    
    func loadWeather() async {
        do {
            exampleWeather = try await weatherRepository.getWeather()
        } catch {
            await MessageObserver.shared.handleError(error)
        }
    }
}
