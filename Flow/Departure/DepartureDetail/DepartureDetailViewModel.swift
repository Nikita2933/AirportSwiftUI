//
//  DepartureDetailViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 16.04.2022.
//

import Foundation

final class DepartureDetailViewModel: ObservableObject {
    let model: DepartureCellModel

    init(model: DepartureCellModel) {
        self.model = model
    }
}
