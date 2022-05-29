//
//  DefaultDepartureRepository.swift
//  
//
//  Created by Никита Иванов on 28.05.2022.
//

import Alamofire
import CoreAirport
import Domain
import Foundation
import RealmSwift

public final class DefaultDepartureRepository: DepartureRepository {

    let departureDatabase: DepartureDatabase
    let apiDeparture: ApiDeparture

    public init(departureDatabase: DepartureDatabase, apiDeparture: ApiDeparture) {
        self.departureDatabase = departureDatabase
        self.apiDeparture = apiDeparture
    }

    @MainActor public func getListDeparture(args: GetAirportListArgs) async throws -> [DepartureModel] {
        let apiDepartureModel: ApiDepartureModel
        do {
            apiDepartureModel = try await apiDeparture.getListDeparture(args: args)
        } catch let error {
            Task {
                await MessageObserver.shared.handleError(error)
            }
            let oldModel = departureDatabase.getRealmEntity(entity: RealmDeparture()) as RealmDeparture?
            return oldModel!.data.map { $0.toDepartureModel() }
        }

        departureDatabase.addToRealmDeparture(model: apiDepartureModel)

        let newModel = departureDatabase.getRealmEntity(entity: RealmDeparture()) as RealmDeparture?
        return newModel!.data.map { $0.toDepartureModel() }
    }
}
