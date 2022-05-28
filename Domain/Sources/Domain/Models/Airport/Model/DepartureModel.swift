//
//  DepartureModel.swift
//  
//
//  Created by Никита Иванов on 28.05.2022.
//

import Foundation

public struct DepartureModel: Hashable {
    public let departureTime: String
    public let aviaCompany: String
    public let reisName: String
    public let flyDirection: String
    public let statusLabel: String?

    public init(
        departureTime: String,
        aviaCompany: String,
        reisName: String,
        flyDirection: String,
        statusLabel: String?
    ) {
        self.departureTime = departureTime
        self.aviaCompany = aviaCompany
        self.reisName = reisName
        self.flyDirection = flyDirection
        self.statusLabel = statusLabel
    }
}
