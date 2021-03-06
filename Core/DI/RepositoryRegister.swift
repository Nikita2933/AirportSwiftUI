//
//  AirportApiModule.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 29.04.2022.
//

import Persistant
import Resolver
import Domain

extension Resolver {
    public static func registerRepository() {
        register(ArrivalRepository.self) {
            DefaultArrivalRepository(
                arrivalDatabase: resolve(),
                apiArrival: resolve()
            )
        }
        register(DepartureRepository.self) {
            DefaultDepartureRepository(
                departureDatabase: resolve(),
                apiDeparture: resolve()
            )
        }
        register(WeatherRepository.self) {
            DefaultWeatherRepository(
                weatherDatabase: resolve(),
                apiWeather: resolve()
            )
        }
        register(PaginationRepository.self) {
            DefaultPaginationRepository(
                apiPagination: resolve()
            )
        }
    }
}
