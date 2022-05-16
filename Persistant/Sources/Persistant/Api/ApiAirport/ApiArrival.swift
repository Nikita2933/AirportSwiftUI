//
//  ApiArrival.swift
//  
//
//  Created by Никита Иванов on 03.05.2022.
//

import Foundation

public protocol ApiArrival: AnyObject {
    func getListArrival(args: GetListArrivalArgs) async throws -> Data
}
