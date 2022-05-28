//
//  MessageObserver.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 28.05.2022.
//

import SwiftUI

public actor MessageObserver: ObservableObject {
    public static var shared = MessageObserver()
    public static var sharedSheet = MessageObserver()

    public enum MessageType {
        case error, message
    }

    public init() {

    }

    @Published public nonisolated var error: Error?
    @Published public nonisolated var showingError = false
    @Published public nonisolated var message: String?

    @Published public nonisolated var messageType: MessageType = .error

    @MainActor fileprivate func showError<E: Error>(_ error: E, _ message: String?) async {
        withAnimation {
            self.error = error
            self.showingError = true
            self.message = message
            self.messageType = .error
        }
    }

    @MainActor fileprivate func showMessage( _ message: String?) async {
        withAnimation {
            self.message = message
            self.showingError = true
            self.messageType = .message
        }
    }

    @MainActor public func handleError<E: Error>(_ error: E, message: String? = nil, showAlert: Bool = true) async {
        print(message ?? "Unknown error")
        print(error)

        if showAlert {
            await showError(error, message)
        }
    }

    @MainActor public func handleMessage(message: String) async {
        await showMessage(message)
    }

}
