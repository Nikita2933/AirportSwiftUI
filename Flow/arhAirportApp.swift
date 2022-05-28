//
//  arhAirportApp.swift
//  Shared
//
//  Created by Никита Иванов on 07.03.2022.
//

import SwiftUI
import CoreAirport

@main
struct arhAirportApp: App {
    var body: some Scene {
        WindowGroup {
            MessageHandler {
                ContentView()
            }
        }
    }
}
