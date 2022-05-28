//
//  ApiDeparture.swift
//  
//
//  Created by Никита Иванов on 28.05.2022.
//

import Foundation
import Domain

public protocol ApiDeparture: AnyObject {
    func getListDeparture(args: GetAirportListArgs) async throws -> Data
}
