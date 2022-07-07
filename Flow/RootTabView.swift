//
//  TabViewState.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import Foundation

public enum RootTabView {
    case pagination, arrival, departure, weather, contact
}

public enum PageTabView: Int {
    case tomorrow, today, yesterday
}
