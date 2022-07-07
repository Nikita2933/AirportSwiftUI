//
//  PaginationLoadManager.swift
//  
//
//  Created by Никита Иванов on 07.07.2022.
//

import Foundation

public class PaginationLoadManager {

    public var params: ScreenParams

    public init(params: ScreenParams) {
        self.params = params
    }

    open func resetPage() {
        params.canLoadNext = false
        params.currentOffset = 0
    }

    open func incrementPage() {
        params.currentOffset += params.limit
        params.canLoadNext = false
    }

    open func updateNextPage(hasNextPage: Bool) {
        params.canLoadNext = hasNextPage
    }

    public var canLoadNextPage: Bool {
        return params.canLoadNext
    }

    public var offset: Int {
        return params.currentOffset
    }

    public var limit: Int {
        return params.limit
    }
}
