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
    @Persisted public var hourly = List<CurrentData>()
}

public class CurrentData: Object {
    @Persisted public var dt: Int = 0
    @Persisted public var temp: String = ""
    @Persisted public var feelsLike: String = ""
    @Persisted public var pressure: String = ""
    @Persisted public var humidity: String = ""
    @Persisted public var dewPoint: String = ""
    @Persisted public var clouds: String = ""
    @Persisted public var visibility: String = ""
    @Persisted public var windSpeed: String = ""
    @Persisted public var windDeg: String = ""
    @Persisted public var weather: WeatherData?
    @Persisted public var rain: RainData?
    @Persisted public var snow: SnowData?
    public let sunrise = RealmProperty<Int?>()
    public let sunset = RealmProperty<Int?>()
    public let pop = RealmProperty<Double?>()
    @Persisted public var windGust: String?
    @Persisted public var uvi: String?
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
