//
//  ArrivalDataList.swift
//  
//
//  Created by Никита Иванов on 07.05.2022.
//

import Foundation
import RealmSwift
import Domain

extension ArrivalDataList {
    public func toArrivalModel() -> ArrivalModel {
        .init(
            arrivalTime: arrivalTime,
            departureTime: departureTime,
            aviaCompany: company,
            reisName: flight,
            craft: craft,
            airportDeparture: airportDeparture,
            airportArrival: airportArrival,
            statusLabel: remark
        )
    }
}
