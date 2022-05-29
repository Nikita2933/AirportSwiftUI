//
//  ApiWeatherModel.swift
//  
//
//  Created by Никита Иванов on 29.05.2022.
//

import Foundation

// MARK: - WeatherModel
public struct ApiWeatherModel: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let hourly: [Current]

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
        case timezone = "timezone"
        case timezoneOffset = "timezone_offset"
        case current = "current"
        case hourly = "hourly"
    }
}

// MARK: - Current
public struct Current: Codable {
    let dt: Int
    let sunrise: Int?
    let sunset: Int?
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double?
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windGust: Double?
    let windDeg: Int
    let weather: [Weather]
    let rain: Rain?
    let pop: Double?
    let snow: Snow?

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case temp = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewPoint = "dew_point"
        case uvi = "uvi"
        case clouds = "clouds"
        case visibility = "visibility"
        case windSpeed = "wind_speed"
        case windGust = "wind_gust"
        case windDeg = "wind_deg"
        case weather = "weather"
        case rain = "rain"
        case pop = "pop"
        case snow = "snow"
    }
}

// MARK: - Weather
public struct Weather: Codable {
    let id: Int
    let main, icon: String
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case weatherDescription = "description"
        case icon = "icon"
    }
}

// MARK: - Snow
public struct Snow: Codable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

public struct Rain: Codable {
    let the1H: Double

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}
