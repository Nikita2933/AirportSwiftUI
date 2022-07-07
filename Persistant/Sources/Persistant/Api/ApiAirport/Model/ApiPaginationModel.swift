//
//  ApiPaginationModel.swift
//  
//
//  Created by Никита Иванов on 07.07.2022.
//

public struct ApiPaginationModel: Codable {
    let embedded: AirportPage

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}
struct AirportPage: Codable {
    let items: [ApiPaginationItem]

    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

struct ApiPaginationItem: Codable {
    let id: String
    let airportDeparture: String
    let airportArrival: String
    let period: String
    let craft: String
    let flight: String
    let frequency: String
    let timeDeparture: String
    let timeArrival: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case airportDeparture = "airport_departure"
        case airportArrival = "airport_arrival"
        case period = "period"
        case craft = "craft"
        case flight = "flight"
        case frequency = "frequency"
        case timeDeparture = "time_departure"
        case timeArrival = "time_arrival"
    }
}
