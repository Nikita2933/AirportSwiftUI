//
//  File.swift
//  
//
//  Created by Никита Иванов on 07.05.2022.
//

import Foundation
import RealmSwift

extension ArrivalDataList {
    func toArrivalModel() -> ArrivalModel {
        .init(
            departureTime: departureTime,
            aviaCompany: company,
            reisName: flight,
            flyDirection: airportDeparture,
            statusLabel: remark
        )
    }
}
