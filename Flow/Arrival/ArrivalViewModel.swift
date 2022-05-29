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
import CoreAirport

final class ArrivalViewModel: ObservableObject {

    private var arrivalRepository: ArrivalRepository
    @Published public var exampleList: [ArrivalModel] = []
    @Published public var loading: Bool = false
    let time: DayTime

    init(time: DayTime, arrivalRepository: ArrivalRepository) {
        self.time = time
        self.arrivalRepository = arrivalRepository

        Task {
            await getData()
        }
    }

    @MainActor func getData() async {
        do {
            loading = true
            exampleList = try await arrivalRepository.getListArrival(args: .init(times: time))
            loading = false
        } catch let error {
            await MessageObserver.shared.handleError(error)
        }
    }

}


