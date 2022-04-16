//
//  WeatherCellModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 16.04.2022.
//

import Foundation
import UIKit

struct WeatherCellModel: Hashable {
    let time: String
    let weatherIcon: UIImage
    let temperature: String
    let windSpeed: String
}
