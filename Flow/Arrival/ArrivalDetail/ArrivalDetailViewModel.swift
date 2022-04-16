//
//  ArrivalDetailViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 02.04.2022.
//

import Foundation

final class ArrivalDetailViewModel: ObservableObject {
    let model: ArrivalCellModel

    init(model: ArrivalCellModel) {
        self.model = model
    }
}
