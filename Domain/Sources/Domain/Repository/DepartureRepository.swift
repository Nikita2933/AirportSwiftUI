//
//  DepartureRepository.swift
//  
//
//  Created by Никита Иванов on 28.05.2022.
//

public protocol DepartureRepository {
    @MainActor func getListDeparture(args: GetAirportListArgs) async throws -> [DepartureModel]
}
