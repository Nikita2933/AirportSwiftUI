//
//  ApiAirportConfiguration.swift
//  
//
//  Created by Никита Иванов on 01.05.2022.
//

import Foundation

public enum ApiAirportConfiguration {

    private static let host = "arh.aero"

    var url: URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = ApiAirportConfiguration.host

        return urlComponents.url!
    }

}
