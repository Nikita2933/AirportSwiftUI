//
//  ApiArrival.swift
//  
//
//  Created by Никита Иванов on 03.05.2022.
//

import Foundation
import Domain

public protocol ApiArrival: AnyObject {
    func getListArrival(args: GetAirportListArgs) async throws -> ApiArrivalModel
}
