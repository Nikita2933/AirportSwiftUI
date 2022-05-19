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
            RealmAirportDatabase()
        }
        register(ApiArrival.self) {
            DefaultApiAirport()
        }
    }
}

