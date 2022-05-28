//
//  RealmAirPortDatabase.swift
//  
//
//  Created by Никита Иванов on 04.05.2022.
//

import Foundation
import RealmSwift
import Domain

public final class RealmAirportDatabase: ArrivalDatabase, DepartureDatabase {

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
            let arrivalInput = model.embedded.items
            let arrivalData = RealmArrival()
            arrivalInput.forEach { item in
                let newArrivalListDB = ArrivalDataList()

                newArrivalListDB.id = Int(item.id)!
                newArrivalListDB.airportDeparture = item.airportDeparture
                newArrivalListDB.airportArrival = item.airportArrival
                newArrivalListDB.flight = item.flight
                newArrivalListDB.company = item.company
                newArrivalListDB.remark = item.remark?.trimmingCharacters(in: .whitespacesAndNewlines)
                newArrivalListDB.craft = item.craft
                newArrivalListDB.arrivalTime = item.arrivalTime
                newArrivalListDB.departureTime = item.departureTime

                arrivalData.data.append(newArrivalListDB)
            }
            realm.add(arrivalData)
        })
    }

    public func addToRealmDeparture(model: ApiDepartureModel) {
        let realm = try! Realm()
        try! realm.write({
            if let oldModel = getRealmEntity(entity: RealmDeparture()) {
                realm.delete(oldModel)
            }
            let departureInput = model.embedded.items
            let departureData = RealmDeparture()
            departureInput.forEach { item in
                let newDepartureDB = DepartureDataList()

                newDepartureDB.id = Int(item.id)!
                newDepartureDB.airportDeparture = item.airportDeparture
                newDepartureDB.airportArrival = item.airportArrival
                newDepartureDB.flight = item.flight
                newDepartureDB.company = item.company
                newDepartureDB.remark = item.remark?.trimmingCharacters(in: .whitespacesAndNewlines)
                newDepartureDB.craft = item.craft
                newDepartureDB.arrivalTime = item.arrivalTime
                newDepartureDB.departureTime = item.departureTime

                departureData.data.append(newDepartureDB)
            }
            realm.add(departureData)
        })
    }
}
