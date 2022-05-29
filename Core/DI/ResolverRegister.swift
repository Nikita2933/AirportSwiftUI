//
//  ResolverRegister.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 29.04.2022.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerService()
        registerRepository()
        registerViewModel()
    }
}

