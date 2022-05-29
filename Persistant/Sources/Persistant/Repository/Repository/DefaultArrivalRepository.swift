//
//  DefaultAirportRepository.swift
//  
//
//  Created by Никита Иванов on 03.05.2022.
//

import Alamofire
import CoreAirport
import Domain
import Foundation
import RealmSwift
import SwiftSoup

public final class DefaultArrivalRepository: ArrivalRepository {

    let arrivalDatabase: ArrivalDatabase
    let apiArrival: ApiArrival

    public init(arrivalDatabase: ArrivalDatabase, apiArrival: ApiArrival) {
        self.arrivalDatabase = arrivalDatabase
        self.apiArrival = apiArrival
    }

    @MainActor public func getListArrival(args: GetAirportListArgs) async throws -> [ArrivalModel] {
        let apiArrivalModel: ApiArrivalModel
        do {
            apiArrivalModel = try await apiArrival.getListArrival(args: args)
        } catch let error {
            Task {
                await MessageObserver.shared.handleError(error)
            }
            let oldModel = arrivalDatabase.getRealmEntity(entity: RealmArrival()) as RealmArrival?
            return oldModel!.data.map { $0.toArrivalModel() }
        }

        arrivalDatabase.addToRealmArrival(model: apiArrivalModel)

        let newModel = arrivalDatabase.getRealmEntity(entity: RealmArrival()) as RealmArrival?
        return newModel!.data.map { $0.toArrivalModel() }

    }
}
