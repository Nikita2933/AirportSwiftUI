//
//  RealmAirPortDatabase.swift
//  
//
//  Created by Никита Иванов on 04.05.2022.
//

import Foundation
import RealmSwift
import Domain
import CoreAirport

public final class DefaultRealmDatabase: ArrivalDatabase, DepartureDatabase, WeatherDatabase {

    public init() { }

    public func getRealmEntity<T: Object>(entity: T) -> T? {
        let realm = try! Realm()
        let models = realm.objects(T.self)
        if let modelsLast = models.last {
            return modelsLast
        } else {
            return nil
        }
    }

    public func addToRealmArrival(model: ApiArrivalModel) {
        let realm = try! Realm()
        try! realm.write({
            if let oldModel = getRealmEntity(entity: RealmArrival()) {
                realm.delete(oldModel)
            }
            let arrivalData = RealmArrival()
            let arrivalInput = model.embedded.items
         
            let arrivalList = List<ArrivalDataList>()
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

                arrivalList.append(newArrivalListDB)
            }
            arrivalData.data = arrivalList
            realm.add(arrivalData)
        })
    }

    public func addToRealmDeparture(model: ApiDepartureModel) {
        let realm = try! Realm()
        try! realm.write({
            
            if let oldModel = getRealmEntity(entity: RealmDeparture()) {
                realm.delete(oldModel)
            }
            let departureData = RealmDeparture()
            let departureInput = model.embedded.items

            let departureItem = List<DepartureDataList>()
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

                departureItem.append(newDepartureDB)
            }
            
            departureData.data = departureItem
            realm.add(departureData)
        })
    }

    public func addToRealmWeather(model: ApiWeatherModel) {
        let realm = try! Realm()
        try! realm.write({
             let weatherDataModel = getRealmEntity(entity: RealmWeather()) ?? RealmWeather()
             weatherDataModel.timezone = model.timezone
             weatherDataModel.timezoneOffset = model.timezoneOffset

             let currentData = currentAdd(currentModel: model.current)
             weatherDataModel.current = currentData

             model.current.weather.forEach { weather in
                 let weatherData = WeatherData()
                 weatherData.icon = weather.icon
                 weatherData.id = weather.id
                 weatherData.main = weather.main
                 weatherData.weatherDescription = weather.weatherDescription

                 weatherDataModel.current?.weather = weatherData
             }

             let rainData = RainData()
             rainData.the1H.value = model.current.rain?.the1H
             weatherDataModel.current?.rain = rainData

             let snowData = SnowData()
             snowData.the1H.value = model.current.snow?.the1H
             weatherDataModel.current?.snow = snowData
            
            let hourlyData = List<CurrentData>()
            
             model.hourly.forEach { hourly in
                 hourlyData.append(currentAdd(currentModel: hourly))
             }
            
            weatherDataModel.hourly = hourlyData
             realm.add(weatherDataModel)
         })
    }

    private func currentAdd(currentModel: Current) -> CurrentData {
        let currentData = CurrentData()

        currentData.dt = currentModel.dt
        currentData.sunrise.value = currentModel.sunrise
        currentData.sunset.value = currentModel.sunset
        currentData.temp = currentModel.temp.toStringWeather()
        currentData.feelsLike = currentModel.feelsLike.toStringWeather()
        currentData.pressure = currentModel.pressure.toStringWeather()
        currentData.humidity = currentModel.humidity.toStringWeather()
        currentData.dewPoint = currentModel.dewPoint.toStringWeather()
        currentData.uvi = currentModel.uvi?.toStringWeather()
        currentData.clouds = currentModel.clouds.toStringWeather()
        currentData.visibility = currentModel.visibility.toStringWeather()
        currentData.windSpeed = currentModel.windSpeed.toStringWeather()
        currentData.windGust = currentModel.windGust?.toStringWeather()
        currentData.windDeg = currentModel.windDeg.toStringWeather()
        currentData.pop.value = currentModel.pop

        currentModel.weather.forEach { weather in
            let weatherData = WeatherData()
            weatherData.icon = weather.icon
            weatherData.id = weather.id
            weatherData.main = weather.main
            weatherData.weatherDescription = weather.weatherDescription

            currentData.weather = weatherData
        }

        return currentData
    }
}
