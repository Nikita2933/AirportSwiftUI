//
//  DepartureModel.swift
//  
//
//  Created by Никита Иванов on 28.05.2022.
//

import Foundation

public struct DepartureModel: Hashable {
    public let arrivalTime: String
    public let departureTime: String
    public let aviaCompany: String
    public let reisName: String
    public let craft: String
    public let airportDeparture: String
    public let airportArrival: String
    public let statusLabel: String?

    public init(
        arrivalTime: String,
        departureTime: String,
        aviaCompany: String,
        reisName: String,
        craft: String,
        airportDeparture: String,
        airportArrival: String,
        statusLabel: String?
    ) {
        self.arrivalTime = arrivalTime
        self.departureTime = departureTime
        self.aviaCompany = aviaCompany
        self.craft = craft
        self.reisName = reisName
        self.airportDeparture = airportDeparture
        self.airportArrival = airportArrival
        self.statusLabel = statusLabel
    }
}
