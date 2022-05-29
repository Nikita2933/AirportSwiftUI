//
//  ViewModelRegister.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 29.05.2022.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerViewModel() {
        register { (_, args)  in
            return ArrivalViewModel(time: args.get(), arrivalRepository: resolve())
        }
        register { (_, args)  in
            return DepartureViewModel(time: args.get(), departureRepository: resolve())
        }
        register (WeatherViewModel.self) {
            .init(weatherRepository: resolve())
        }
    }
}
