//
//  ContactView.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import SwiftUI

struct ContactView: View {
    @StateObject var viewModel: ContactViewModel = ContactViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.contactList, id: \.self) { item in
                    Button {
                        viewModel.handleContactTap(item: item)
                    } label: {
                        ContactViewListCell(model: item)
                    }
                }
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolbarMenu()
                }
            }
            .navigationTitle(LocalizableStrings.Contact.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContactViewListCell: View {
    let model: ContactModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.title)
                Text(model.subtitle)
                    .font(.system(size: 12))
            }
            Spacer()
            Image(uiImage: model.icon)
        }
    }
}
