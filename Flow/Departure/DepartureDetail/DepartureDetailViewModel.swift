//
//  DepartureDetailViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 16.04.2022.
//

import Foundation
import Domain

final class DepartureDetailViewModel: ObservableObject {
    let model: DepartureModel

    init(model: DepartureModel) {
        self.model = model
    }
}
