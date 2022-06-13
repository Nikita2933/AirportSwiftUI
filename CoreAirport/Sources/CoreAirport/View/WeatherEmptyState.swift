//
//  WeatherEmptyState.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 13.06.2022.
//

import SwiftUI

public struct WeatherEmptyState: View {
    
    public init(){}

    public var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Не удалось получить данные /n попробуйте обновить экран свайпом вниз")
                    .font(.system(size: 24, weight: .regular))
            }
            Spacer()
        }
    }
}
