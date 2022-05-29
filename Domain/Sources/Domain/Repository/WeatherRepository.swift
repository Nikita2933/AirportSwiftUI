//
//  WeatherRepository.swift
//  
//
//  Created by Никита Иванов on 29.05.2022.
//

import Foundation

public protocol WeatherRepository {
    @MainActor func getWeather() async throws -> RealmWeather
}
