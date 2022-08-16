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
        List {
            VStack {
                VStack(alignment: .leading) {
                    Text(viewModel.model.reisName)
                        .font(.system(size: 30))
                        .bold()
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(LocalizableStrings.Airport.aviaCompany(viewModel.model.aviaCompany))
                        Spacer()
                        if let status = viewModel.model.statusLabel {
                            Text(LocalizableStrings.Airport.status(status))
                                .lineLimit(0)
                        }
                        Divider()
                    }
                    .listRowSeparator(.hidden)
                    Spacer()
                    VStack(alignment: .center) {
                        HStack {
                            VStack {
                                Text(viewModel.model.airportArrival)
                                Text(viewModel.model.arrivalTime)
                            }
                            Image(asset: Resources.Images.arrowRightThick)
                            VStack {
                                Text(viewModel.model.airportDeparture)
                                Text(viewModel.model.departureTime)
                            }

                        }
                        .font(.system(size: 20))
                    }
                }
                .padding(.top, 16)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }

}
