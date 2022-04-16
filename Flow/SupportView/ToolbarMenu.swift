//
//  ToolbarMenu.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 16.04.2022.
//

import SwiftUI

struct ToolbarMenu: View {
    var body: some View {
        Menu {
            Button(action: {

            }, label: {
                Text("Настройки")
            })

            Button(action: {

            }, label: {
                Text("Настройки")
            })
        } label: {
            Image(uiImage: Resources.Images.menuIcon.image)
        }
    }
}
