//
//  RealmDeparture+Mapping.swift
//  
//
//  Created by Никита Иванов on 28.05.2022.
//

import Foundation
import RealmSwift
import Domain

extension DepartureDataList {
    public func toDepartureModel() -> DepartureModel {
        .init(
            departureTime: departureTime,
            aviaCompany: company,
            reisName: flight,
            flyDirection: airportDeparture,
            statusLabel: remark
        )
    }
}
