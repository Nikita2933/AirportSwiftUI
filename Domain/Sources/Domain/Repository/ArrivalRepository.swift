//
//  ArrivalRepository.swift
//  
//
//  Created by Никита Иванов on 07.05.2022.
//

public protocol ArrivalRepository {
    @MainActor func getListArrival(args: GetAirportListArgs) async throws -> [ArrivalModel]
}
