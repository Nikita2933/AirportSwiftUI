//
//  RealmWeather.swift
//  
//
//  Created by Никита Иванов on 29.05.2022.
//
import Foundation
import RealmSwift

public class RealmWeather: Object {
    @Persisted public var lat: Double = 0
    @Persisted public var lon: Double = 0
    @Persisted public var timezone: String = ""
    @Persisted public var timezoneOffset: Int = 0
    @Persisted public var current: CurrentData?
    public let hourly = List<CurrentData>()
}

public class CurrentData: Object {
    @Persisted public var dt: Int = 0
    @Persisted public var temp: Double = 0
    @Persisted public var feelsLike: Double = 0
    @Persisted public var pressure: Int = 0
    @Persisted public var humidity: Int = 0
    @Persisted public var dewPoint: Double = 0
    @Persisted public var clouds: Int = 0
    @Persisted public var visibility: Int = 0
    @Persisted public var windSpeed: Double = 0
    @Persisted public var windDeg: Int = 0
    @Persisted public var weather: WeatherData?
    @Persisted public var rain: RainData?
    @Persisted public var snow: SnowData?
    public let sunrise = RealmProperty<Int?>()
    public let sunset = RealmProperty<Int?>()
    public let pop = RealmProperty<Double?>()
    public let windGust = RealmProperty<Double?>()
    public let uvi = RealmProperty<Double?>()
}

public class WeatherData: Object {
    @Persisted public var id: Int = 0
    @Persisted public var main: String = ""
    @Persisted public var icon: String = ""
    @Persisted public var weatherDescription: String = ""
}

public class SnowData: Object {
    public let the1H = RealmProperty<Double?>()
}

public class RainData: Object {
    public let the1H = RealmProperty<Double?>()
}
