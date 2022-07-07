//
//  ScreenParams.swift
//  
//
//  Created by Никита Иванов on 07.07.2022.
//

import Foundation

public protocol ScreenParams: AnyObject {
    var canLoadNext: Bool { get set }
    var currentOffset: Int { get set }
    var limit: Int { get set }
    init(offset: Int, limit: Int, canLoadNext: Bool)
}
