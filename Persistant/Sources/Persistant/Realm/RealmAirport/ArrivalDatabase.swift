//
//  ArrivalDatabase.swift
//  
//
//  Created by Никита Иванов on 04.05.2022.
//

import Foundation
import RealmSwift

public protocol ArrivalDatabase: AnyObject {
    func getRealmEntity<T: Object>(entity: T) -> T?
    func addToRealmArrival(model: ApiArrivalModel)
}

