//
//  Int+toStringWeahter.swift
//  
//
//  Created by Никита Иванов on 13.06.2022.
//

import Foundation

public extension Int {
    func toStringWeather() -> String {
        return String(format: "%.0f", self)
    }
    
    func toWeatherDate() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateStyle = .short
        
        return dateFormatter.string(from: date)
    }
    
    func toWeatherHourMinute() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "EE. h:mm"
        
        let dateFromInterval = TimeInterval(self)

        return dateFormatter.string(from: Date(timeIntervalSince1970: dateFromInterval) )
    }
}
