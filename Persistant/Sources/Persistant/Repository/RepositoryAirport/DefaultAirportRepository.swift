//
//  DefaultAirportRepository.swift
//  
//
//  Created by Никита Иванов on 03.05.2022.
//

import Alamofire
import Foundation
import RealmSwift
import SwiftSoup

public final class DefaultAirportRepository: ArrivalRepository {

    let arrivalDatabase: ArrivalDatabase
    let apiArrival: ApiArrival

    public init(arrivalDatabase: ArrivalDatabase, apiArrival: ApiArrival) {
        self.arrivalDatabase = arrivalDatabase
        self.apiArrival = apiArrival
    }

    @MainActor public func getListArrival(args: GetListArrivalArgs) async -> [ArrivalModel] {
        do {
            let data = try await apiArrival.getListArrival(args: args)
            let apiArrivalModel = try JSONDecoder().decode(ApiArrivalModel.self, from: data)

            arrivalDatabase.addToRealmArrival(model: apiArrivalModel)

            let newModel = await arrivalDatabase.getRealmEntity(entity: RealmArrival()) as RealmArrival?
            return newModel!.data.map { $0.toArrivalModel() }
        } catch let error {
            print(error.localizedDescription)
            return []
        }
        
    }
}
