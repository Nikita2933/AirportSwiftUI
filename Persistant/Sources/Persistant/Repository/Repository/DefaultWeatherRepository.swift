//
//  DefaultWeatherRepository.swift
//  
//
//  Created by Никита Иванов on 29.05.2022.
//

import Domain
import CoreAirport
import Foundation

public final class DefaultWeatherRepository: WeatherRepository {

    let weatherDatabase: WeatherDatabase
    let apiWeather: ApiWeather

    public init(weatherDatabase: WeatherDatabase, apiWeather: ApiWeather) {
        self.weatherDatabase = weatherDatabase
        self.apiWeather = apiWeather
    }

    @MainActor public func getWeather() async throws -> RealmWeather {
        let apiWeatherModel: ApiWeatherModel
        do {
            apiWeatherModel = try await apiWeather.getWeather()
        } catch let error {
            Task {
                await MessageObserver.shared.handleError(error)
            }
            let oldModel = weatherDatabase.getRealmEntity(entity: RealmWeather()) as RealmWeather?
            return oldModel.unsafelyUnwrapped
        }

        weatherDatabase.addToRealmWeather(model: apiWeatherModel)

        let newModel = weatherDatabase.getRealmEntity(entity: RealmWeather()) as RealmWeather?
        return newModel.unsafelyUnwrapped
    }
}
