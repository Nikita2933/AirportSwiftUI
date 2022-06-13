//
//  Results+toArray.swift
//  
//
//  Created by Никита Иванов on 13.06.2022.
//

import RealmSwift

public extension List {
    func toArray() -> [Element] {
        return compactMap {
            $0
        }
    }
}
