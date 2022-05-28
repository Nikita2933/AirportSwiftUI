//
//  DepartureViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import Foundation
import Domain
import SwiftUI
import Resolver

final class DepartureViewModel: ObservableObject {

    @Injected private var departureRepository: DepartureRepository
    @Published public var exampleList: [DepartureModel] = []


    init(time: DayTime) {
        Task.init {
            exampleList = await getData(time: time)
        }
    }

    func getData(time: DayTime) async -> [DepartureModel] {
        do {
            return try await departureRepository.getListDeparture(args: .init(times: time))
        } catch let error {
            print("handle error \(error)")
            return []
        }
    }

}


