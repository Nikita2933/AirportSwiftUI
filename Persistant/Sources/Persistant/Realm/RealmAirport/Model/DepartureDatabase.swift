//
//  DepartureDatabase.swift
//  
//
//  Created by Никита Иванов on 01.05.2022.
//
import Foundation
import RealmSwift

public protocol DepartureDatabase: AnyObject {
    func getRealmEntity<T: Object>(entity: T) -> T?
    func addToRealmDeparture(model: ApiDepartureModel)
}

