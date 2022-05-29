//
//  ServiceRegister.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 14.05.2022.
//

import Persistant
import RealmSwift
import Resolver

extension Resolver {
    public static func registerService() {
        register(ArrivalDatabase.self) {
            DefaultRealmDatabase()
        }
        register(ApiArrival.self) {
            DefaultApiAirport()
        }
        register(DepartureDatabase.self) {
            DefaultRealmDatabase()
        }
        register(ApiDeparture.self) {
            DefaultApiAirport()
        }
        register(WeatherDatabase.self) {
            DefaultRealmDatabase()
        }
        register(ApiWeather.self) {
            DefaultApiWeather()
        }
    }
}
