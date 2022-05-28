//
//  DefaultDepartureRepository.swift
//  
//
//  Created by Никита Иванов on 28.05.2022.
//

import Alamofire
import Domain
import Foundation
import RealmSwift
import SwiftSoup

public final class DefaultDepartureRepository: DepartureRepository {

    let departureDatabase: DepartureDatabase
    let apiDeparture: ApiDeparture

    public init(departureDatabase: DepartureDatabase, apiDeparture: ApiDeparture) {
        self.departureDatabase = departureDatabase
        self.apiDeparture = apiDeparture
    }

    @MainActor public func getListDeparture(args: GetAirportListArgs) async throws -> [DepartureModel] {
        let data: Data
        do {
            data = try await apiDeparture.getListDeparture(args: args)
        } catch let error {
            print("handle error \(error)")
            let oldModel = departureDatabase.getRealmEntity(entity: RealmDeparture()) as RealmDeparture?
            return oldModel!.data.map { $0.toDepartureModel() }
        }
        let apiDepartureModel = try JSONDecoder().decode(ApiDepartureModel.self, from: data)

        departureDatabase.addToRealmDeparture(model: apiDepartureModel)

        let newModel = departureDatabase.getRealmEntity(entity: RealmDeparture()) as RealmDeparture?
        return newModel!.data.map { $0.toDepartureModel() }
    }
}
