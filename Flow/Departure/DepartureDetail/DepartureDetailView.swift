//
//  DepartureDetailView.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 16.04.2022.
//

import Foundation
import SwiftUI

struct DepartureDetailView: View {

    @StateObject var viewModel: DepartureDetailViewModel
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.model.departureTime)
                Text(viewModel.model.aviaCompany)
            }
        }
    }
}
