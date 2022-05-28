//
//  ArrivalViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import Foundation
import Domain
import SwiftUI
import Resolver

final class ArrivalViewModel: ObservableObject {

    @Injected private var arrivalRepository: ArrivalRepository
    @Published public var exampleList: [ArrivalModel] = []


    init(time: DayTime) {
        Task.init {
            exampleList = await getData(time: time)
        }
    }

    func getData(time: DayTime) async -> [ArrivalModel] {
        do {
            return try await arrivalRepository.getListArrival(args: .init(times: time))
        } catch let error {
            print("handle error \(error)")
            return []
        }
    }

}


