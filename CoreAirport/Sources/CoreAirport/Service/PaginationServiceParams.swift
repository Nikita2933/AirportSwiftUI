//
//  PaginationServiceParams.swift
//  
//
//  Created by Никита Иванов on 07.07.2022.
//

import Foundation

public final class PaginationServiceParams: ScreenParams {
    public var canLoadNext: Bool
    public var currentOffset: Int
    public var limit: Int

    public init(offset: Int = 0,
         limit: Int = 20,
         canLoadNext: Bool = true) {
        self.currentOffset = offset
        self.limit = limit
        self.canLoadNext = canLoadNext
    }
}
