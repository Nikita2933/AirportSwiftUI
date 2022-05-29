//
//  ApiWeather.swift
//  
//
//  Created by Никита Иванов on 29.05.2022.
//

import Foundation
import Domain

public protocol ApiWeather {
    func getWeather() async throws -> ApiWeatherModel
}
