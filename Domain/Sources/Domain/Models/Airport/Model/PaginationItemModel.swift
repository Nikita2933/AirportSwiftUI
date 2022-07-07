//
//  PaginationItemModel.swift
//  
//
//  Created by Никита Иванов on 07.07.2022.
//

import Foundation

public struct PaginationItemModel: Hashable {
    public let id: String
    public let airportDeparture: String
    public let airportArrival: String
    public let period: String
    public let craft: String
    public let flight: String
    public let frequency: String
    public let timeDeparture: String
    public let timeArrival: String
    
    public init(
        id: String,
        airportDeparture: String,
        airportArrival: String,
        period: String,
        flight: String,
        craft: String,
        frequency: String,
        timeDeparture: String,
        timeArrival: String
    ) {
        self.id = id
        self.airportDeparture = airportDeparture
        self.airportArrival = airportArrival
        self.period = period
        self.craft = craft
        self.flight = flight
        self.frequency = frequency
        self.timeDeparture = timeDeparture
        self.timeArrival = timeArrival
    }
}
