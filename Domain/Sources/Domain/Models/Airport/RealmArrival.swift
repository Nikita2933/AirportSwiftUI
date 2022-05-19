//
//  RealmArrival.swift
//  
//
//  Created by Никита Иванов on 01.05.2022.
//

import Foundation
import RealmSwift

public class RealmArrival: Object {
     public let data = List<ArrivalDataList>()
}

public class ArrivalDataList: Object {
    @Persisted public var id = 0
    @Persisted public var airportDeparture = ""
    @Persisted public var airportArrival = ""
    @Persisted public var flight = ""
    @Persisted public var company = ""
    @Persisted public var remark: String? = nil
    @Persisted public var craft = ""
    @Persisted public var ad1: String? = nil
    @Persisted public var ad2: String? = nil
    @Persisted public var at1: String? = nil
    @Persisted public var at2: String? = nil
    @Persisted public var sd1: String? = nil
    @Persisted public var sd2 = ""
    @Persisted public var arrivalTime = ""
    @Persisted public var departureTime = ""
}
