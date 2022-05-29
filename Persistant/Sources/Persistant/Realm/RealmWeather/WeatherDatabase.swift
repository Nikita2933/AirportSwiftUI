//
//  WeatherDatabase.swift
//  
//
//  Created by Никита Иванов on 29.05.2022.
//

import Foundation
import RealmSwift

public protocol WeatherDatabase: AnyObject {
    func getRealmEntity<T: Object>(entity: T) -> T?
    func addToRealmWeather(model: ApiWeatherModel)
}
