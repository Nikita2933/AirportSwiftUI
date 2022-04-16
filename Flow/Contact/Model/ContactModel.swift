//
//  ContactModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 16.04.2022.
//

import Foundation
import UIKit

struct ContactModel: Hashable {
    let title: String
    let subtitle: String
    let icon: UIImage
    let type: ContactType
}

public enum ContactType: Hashable {
    case web(String), mail(String), map, phone(String)
    
}
