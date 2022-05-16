//
//  ApiArrivalModel.swift
//  
//
//  Created by Никита Иванов on 01.05.2022.
//

import Foundation

public struct ApiArrivalModel: Codable {
    let embedded: Arrival

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

// MARK: - Embedded
struct Arrival: Codable {
    let items: [ArrivalItem]

    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

// MARK: - Item
struct ArrivalItem: Codable {
    let id: String
    let airportDeparture: String
    let airportArrival: String
    let flight: String
    let company: String
    let remark: String?
    let craft: String
    let arrivalTime: String
    let departureTime: String
    let links: ArrivalLinks
    //let embedded: [JSONAny]
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case airportDeparture = "airport_departure"
        case airportArrival = "airport_arrival"
        case flight = "flight"
        case company = "company"
        case remark = "remark"
        case craft = "craft"
        case arrivalTime = "st1"
        case departureTime = "st2"
        case links = "_links"
    }
}

// MARK: - Links
struct ArrivalLinks: Codable {
    let ArrivalSelfClass: ArrivalSelfClass

    enum CodingKeys: String, CodingKey {
        case ArrivalSelfClass = "self"
    }
}

// MARK: - SelfClass
struct ArrivalSelfClass: Codable {
    let href: String

    enum CodingKeys: String, CodingKey {
        case href = "href"
    }
}
