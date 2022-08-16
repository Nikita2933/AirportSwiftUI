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
                                Text(viewModel.model.airportDeparture)
                                Text(viewModel.model.departureTime)
                            }
                            Image(asset: Resources.Images.arrowRightThick)
                            VStack {
                                Text(viewModel.model.airportArrival)
                                Text(viewModel.model.arrivalTime)
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


    struct ArrivalDetailView_Previews: PreviewProvider {
        static var previews: some View {
            ArrivalDetailView(viewModel:
                    .init(
                        model: .init(arrivalTime: "08:55",
                                     departureTime: "10:33",
                                     aviaCompany: "Победа",
                                     reisName: "KCM9652",
                                     craft: "БОИНГ БЛЯТЬ!",
                                     airportDeparture: "Мурманск",
                                     airportArrival: "Жопосранск",
                                     statusLabel: "Всё заебись но могло бы быть лучше")
                )
        )
    }
}
