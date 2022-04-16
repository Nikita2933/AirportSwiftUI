//
//  DepartureCellModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 16.04.2022.
//

import Foundation

struct DepartureCellModel: Hashable {
    let departureTime: String
    let aviaCompany: String
    let reisName: String
    let flyDirection: String
    let statusLabel: String?
}
