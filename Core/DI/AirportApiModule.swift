//
//  AirportApiModule.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 29.04.2022.
//

import Persistant
import Resolver

extension Resolver {
    public static func registerRepository() {
        register(ArrivalRepository.self) {
            DefaultAirportRepository(
                arrivalDatabase: resolve(),
                apiArrival: resolve()
            )
        }
    }
}
