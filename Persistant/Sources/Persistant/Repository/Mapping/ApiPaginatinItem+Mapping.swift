//
//  ApiPaginatinItem+Mapping.swift
//  
//
//  Created by Никита Иванов on 07.07.2022.
//

import Domain

extension ApiPaginationItem {
    func toDomain() -> PaginationItemModel {
        .init(id: id,
              airportDeparture: airportDeparture,
              airportArrival: airportArrival,
              period: period,
              flight: flight,
              craft: craft,
              frequency: frequency,
              timeDeparture: timeDeparture,
              timeArrival: timeArrival
        )
    }
}
