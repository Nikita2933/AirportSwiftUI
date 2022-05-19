//
//  RealmAirPortDatabase.swift
//  
//
//  Created by Никита Иванов on 04.05.2022.
//

import Foundation
import RealmSwift
import Domain

public final class RealmAirportDatabase: ArrivalDatabase {

    public func getRealmEntity<T: Object>(entity: T) -> T? {
        let realm = try! Realm()
        let models = realm.objects(T.self)
        if let modelsLast = models.last {
            return modelsLast
        } else {
            return nil
        }
    }

    public init() { }

    public func addToRealmArrival(model: ApiArrivalModel) {
        let realm = try! Realm()
        try! realm.write({
            if let oldModel = getRealmEntity(entity: RealmArrival()) {
                realm.delete(oldModel)
            }
            let departureInput = model.embedded.items
            let departureData = RealmArrival()
            departureInput.forEach { item in
                let newDepartureDB = ArrivalDataList()

                newDepartureDB.id = Int(item.id)!
                newDepartureDB.airportDeparture = item.airportDeparture
                newDepartureDB.airportArrival = item.airportArrival
                newDepartureDB.flight = item.flight
                newDepartureDB.company = item.company
                newDepartureDB.remark = item.remark
                newDepartureDB.craft = item.craft
                newDepartureDB.arrivalTime = item.arrivalTime
                newDepartureDB.departureTime = item.departureTime

                departureData.data.append(newDepartureDB)
            }
            realm.add(departureData)
        })
    }
}
