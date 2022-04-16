//
//  ArrivalCellModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 02.04.2022.
//

import Foundation

struct ArrivalCellModel: Hashable {
    let departureTime: String
    let aviaCompany: String
    let reisName: String
    let flyDirection: String
    let statusLabel: String?
}
