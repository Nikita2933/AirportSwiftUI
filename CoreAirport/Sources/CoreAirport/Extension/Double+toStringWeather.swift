//
//  Double+toStringWeather.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 13.06.2022.
//

import Foundation

public extension Double {
    public func toStringWeather() -> String {
        return String(format: "%.0f", self)
    }
}
