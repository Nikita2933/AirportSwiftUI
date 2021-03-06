//
//  DefaultApiWeather.swift
//  
//
//  Created by Никита Иванов on 29.05.2022.
//

import Foundation
import Domain
import Alamofire

public final class DefaultApiWeather: ApiWeather {
    public init() { }
    
    public func getWeather() async throws -> ApiWeatherModel {
        try await withUnsafeThrowingContinuation { continuation in
            let parameterDictionary = [
                "lat" : "64.5958",
                "lon" : "40.7170",
                "exclude" : "minutely,daily",
                "units" : "metric",
                "lang" : "ru",
                "appid" : "28658d9919b0553cbab23474ff9b4d13"
            ]

            let header: HTTPHeaders = .init([.accept("text/html; charset=utf-8")])

            AF.request(
                ApiWeatherConfiguration.shared.weatherPath,
                method: .get,
                parameters: parameterDictionary,
                encoder: URLEncodedFormParameterEncoder.default,
                headers: header,
                interceptor: nil,
                requestModifier: .none
            ).responseData { response in
                if let data = response.data {
                    do {
                        let apiWeatherModel = try JSONDecoder().decode(ApiWeatherModel.self, from: data)
                        continuation.resume(returning: apiWeatherModel)
                    } catch let error {
                        continuation.resume(throwing: error)
                    }
                }
                if let error = response.error {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
