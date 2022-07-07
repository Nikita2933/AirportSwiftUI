//
//  ApiAirportConfiguration.swift
//  
//
//  Created by Никита Иванов on 01.05.2022.
//

import Foundation

final class ApiAirportConfiguration {

    public static let shared = ApiAirportConfiguration()

    private static let host = "arh.aero"

    private var url: URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = ApiAirportConfiguration.host

        return urlComponents.url!
    }

    var apiPath: URL {
        url.appendingPathComponent("api")
    }

    var flightPath: URL {
        apiPath.appendingPathComponent("flights/online")
    }
    
    var paginationPath: URL {
        apiPath.appendingPathComponent("flights/regular")
    }
}
