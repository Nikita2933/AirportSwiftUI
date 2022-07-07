//
//  PaginationView.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.07.2022.
//

import SwiftUI
import Resolver

struct PaginationView: View {
    @StateObject var viewModel: PaginationViewModel = Resolver.resolve()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.exampleList, id: \.self) { item in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.airportDeparture)
                                Text("->")
                                Text(item.airportArrival)
                            }
                            Text(LocalizableStrings.Pagination.period(item.period, item.frequency))
                            VStack(alignment: .leading) {
                                Text(LocalizableStrings.Pagination.timeDeparture(item.timeDeparture))
                                Text(LocalizableStrings.Pagination.timeArrival(item.timeArrival))
                            }
                            Text(LocalizableStrings.Pagination.craft(item.craft))
                           
                        }
                    }
                    .listStyle(.plain)
                    if viewModel.loadManager.canLoadNextPage {
                        HStack {
                            Spacer()
                            ProgressView {
                            }
                            Spacer()
                        }
                        .onAppear {
                            Task {
                                await viewModel.loadPage()
                            }
                        }
                    }
                }
                .refreshable {
                    Task {
                        await viewModel.reloadScreen()
                    }
                }
            }
            .navigationTitle(LocalizableStrings.Pagination.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
