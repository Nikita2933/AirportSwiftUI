//
//  ArrivalDetailViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 02.04.2022.
//

import Foundation
import Persistant

final class ArrivalDetailViewModel: ObservableObject {
    let model: ArrivalModel

    init(model: ArrivalModel) {
        self.model = model
    }
}
