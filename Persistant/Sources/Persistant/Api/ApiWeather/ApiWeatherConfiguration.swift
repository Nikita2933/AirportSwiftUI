//
//  ApiWeatherConfiguration.swift
//  
//
//  Created by Никита Иванов on 29.05.2022.
//

import Foundation

final class ApiWeatherConfiguration {

    public static let shared = ApiWeatherConfiguration()

    private static let host = "api.openweathermap.org"

    private var url: URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = ApiWeatherConfiguration.host

        return urlComponents.url!
    }

    var weatherPath: URL {
        url.appendingPathComponent("data/2.5/onecall")
    }
}
