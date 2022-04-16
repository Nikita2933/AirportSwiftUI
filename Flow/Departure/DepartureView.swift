//
//  DepartureView.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import SwiftUI

struct DepartureView: View {
    @StateObject var viewModel = DepartureViewModel()
    @State var isOpenDetail: Bool = false
    @State var selectedDetailModel: DepartureCellModel?

    var body: some View {
        VStack {
            NavigationLink(isActive: $isOpenDetail) {
                if let selectedDetailModel = selectedDetailModel {
                    DepartureDetailView(viewModel: DepartureDetailViewModel(model: selectedDetailModel))
                }
            } label: {
                EmptyView()
            }
            List {
                ForEach(viewModel.exampleList, id: \.self) { element in
                    Button {
                        selectedDetailModel = element
                        isOpenDetail.toggle()
                    } label: {
                        DepartureCell(model: element)
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DepartureCell: View {
    let model: DepartureCellModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(model.departureTime) \(model.flyDirection)")
                Text(model.reisName)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(model.aviaCompany)
                (model.statusLabel != nil) ? Text(model.statusLabel ?? "") : nil
            }
        }
    }
}

struct DeparturePageView: View {
    @State var tabSelection: PageTabView
    let tomorrow = DepartureView()
    let today = DepartureView()
    let yesterday = DepartureView()

    @State var offset: CGFloat = 0

    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $tabSelection) {
                    tomorrow
                        .tag(PageTabView.tomorrow)
                    today
                        .tag(PageTabView.today)
                        .overlay {
                            GeometryReader { proxy -> Color  in
                                DispatchQueue.main.async {
                                    let minX = -proxy.frame(in: .global).minX
                                    withAnimation {
                                        if minX != 0 {
                                            self.offset = -proxy.frame(in: .global).minX
                                        }
                                    }
                                }
                                return Color.clear
                            }
                        }
                    yesterday
                        .tag(PageTabView.yesterday)
                }
                .padding(.top, 40)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .overlay(alignment: .top) {
                    VStack(spacing: 4) {
                        HStack {
                            ForEach(0...2, id: \.self) { index in
                                Button {
                                    withAnimation {
                                        tabSelection = .init(rawValue: index)!
                                    }
                                } label: {
                                    Text (Constants.pageDay[index])
                                }
                                if index != 2 {
                                    Spacer()
                                }
                            }

                        }
                        .padding(.horizontal, 16)
                        Capsule()
                            .fill(Color.accentColor)
                            .frame(
                                width: 70,
                                height: 7
                            )
                            .offset(x: getLineOffset() )
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ToolbarMenu()
                    }
                }
                .navigationTitle(LocalizableStrings.Departure.title)
            }
        }
    }

    func getDayOffset() -> CGFloat {
        print(  -(UIScreen.main.bounds.width / 3))
        return (UIScreen.main.bounds.width / 3)
    }

    func getLineOffset() -> CGFloat {
        ((UIScreen.main.bounds.width / 5) + 70) * (CGFloat(offset) / UIScreen.main.bounds.width)
    }
}

struct Departure_Previews: PreviewProvider {
    static var previews: some View {
        DeparturePageView(tabSelection: .today)
    }
}
