//
//  GetListArrivalArgs.swift
//  
//
//  Created by Никита Иванов on 03.05.2022.
//

import Foundation

public struct GetAirportListArgs {
    public let times: DayTime

    public init(times: DayTime) {
        self.times = times
    }
}

public enum DayTime {
    case today, tomorrow, yesterday

    public var time: String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd-"
        var time = Date()
        switch self {
        case .today:
            break
        case .tomorrow:
            time += 86400
        case .yesterday:
            time -= 86400
        }
        return dateformatter.string(from: time)
    }
}
