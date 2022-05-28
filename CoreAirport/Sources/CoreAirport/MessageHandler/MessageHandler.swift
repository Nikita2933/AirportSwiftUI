//
//  MessageHandler.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 28.05.2022.
//

import SwiftUI
import AlertToast

public struct MessageHandler<Content: View>: View {

    @StateObject fileprivate var errorObserver = MessageObserver.shared

    @ViewBuilder fileprivate var content: () -> Content

    public init(content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        content()
            .toast(
                isPresenting: $errorObserver.showingError,
                duration: 3,
                tapToDismiss: false
            ) {
                switch errorObserver.messageType {
                case .error:
                    return AlertToast(
                        displayMode: .hud,
                        type: .regular,
                        title: errorObserver.message,
                        style: .style(
                            backgroundColor: .red,
                            titleColor: .white,
                            subTitleColor: .white
                        )
                    )
                case .message:
                   return  AlertToast(
                        displayMode: .hud,
                        type: .regular,
                        title: errorObserver.message,
                        style: .style(
                            backgroundColor: .white,
                            titleColor: .black,
                            subTitleColor: .black
                        )
                    )
                }
            }
    }
}
