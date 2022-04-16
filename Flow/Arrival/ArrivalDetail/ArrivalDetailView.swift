//
//  ArrivalDetailView.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 02.04.2022.
//

import Foundation
import SwiftUI

struct ArrivalDetailView: View {

    @StateObject var viewModel: ArrivalDetailViewModel
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.model.departureTime)
                Text(viewModel.model.aviaCompany)
            }
        }
    }
}
