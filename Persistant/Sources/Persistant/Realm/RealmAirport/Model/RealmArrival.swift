//
//  RealmArrival.swift
//  
//
//  Created by Никита Иванов on 01.05.2022.
//

import Foundation
import RealmSwift

public class RealmArrival: Object {
    let data = List<ArrivalDataList>()
}

class ArrivalDataList: Object {
    @Persisted var id = 0
    @Persisted var airportDeparture = ""
    @Persisted var airportArrival = ""
    @Persisted var flight = ""
    @Persisted var company = ""
    @Persisted var remark: String? = nil
    @Persisted var craft = ""
    @Persisted var ad1: String? = nil
    @Persisted var ad2: String? = nil
    @Persisted var at1: String? = nil
    @Persisted var at2: String? = nil
    @Persisted var sd1: String? = nil
    @Persisted var sd2 = ""
    @Persisted var arrivalTime = ""
    @Persisted var departureTime = ""
}
