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
            departureTime: departureTime,
            aviaCompany: company,
            reisName: flight,
            flyDirection: airportDeparture,
            statusLabel: remark
        )
    }
}
