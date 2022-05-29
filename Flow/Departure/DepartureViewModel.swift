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
import CoreAirport

final class DepartureViewModel: ObservableObject {

    private var departureRepository: DepartureRepository
    @Published public var exampleList: [DepartureModel] = []
    @Published public var loading: Bool = false
    let time: DayTime

    init(time: DayTime, departureRepository: DepartureRepository) {
        self.time = time
        self.departureRepository = departureRepository
        Task {
            await getData()
        }
    }

    @MainActor func getData() async {
        do {
            loading = true
            exampleList = try await departureRepository.getListDeparture(args: .init(times: time))
            loading = false
        } catch let error {
            await MessageObserver.shared.handleError(error)
        }
    }
}


