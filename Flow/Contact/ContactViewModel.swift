//
//  ContactViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import Foundation
import UIKit
import MapKit
import MessageUI

final class ContactViewModel: ObservableObject {
    let contactList: [ContactModel] = [
        .init(
            title: "Новый сайт аэропорта",
            subtitle: "https://arh.aero/",
            icon: Resources.Images.web.image,
            type: .web("https://arh.aero/")
        ),
        .init(
            title: "Сайт Аэропорта",
            subtitle: "http://arhaero.ru",
            icon: Resources.Images.web.image,
            type: .web("http://arhaero.ru")
        ),
        .init(
            title: "E-Mail Аэропорта",
            subtitle: "airport@arhaero.ru",
            icon: Resources.Images.email.image,
            type: .mail("airport@arhaero.ru")
        ),
        .init(
            title: "Адрес Аэропорта",
            subtitle: "аэропорт Архангельск, 3 к4",
            icon: Resources.Images.map.image,
            type: .map
        ),
        .init(
            title: "Круглосуточная справочная",
            subtitle: "+7 (8182) 631-600",
            icon: Resources.Images.phone.image,
            type: .phone("+7 (8182) 631-600")
        ),
        .init(
            title: "Пассажирская касса",
            subtitle: "+7 (8182) 631-320",
            icon: Resources.Images.phone.image,
            type: .phone("+7 (8182) 631-320")
        ),
        .init(
            title: "Диспетчер по розыску багажа",
            subtitle: "+7 (8182) 631-508",
            icon: Resources.Images.phone.image,
            type: .phone("+7 (8182) 631-508")
        ),
        .init(
            title: "Музей авиации Севера",
            subtitle: "+7 (8182) 631-564",
            icon: Resources.Images.phone.image,
            type: .phone("+7 (8182) 631-564")
        ),
        .init(
            title: "Гостиница \"Аэроотель\"",
            subtitle: "+7 (8182) 631-527",
            icon: Resources.Images.phone.image,
            type: .phone( "+7 (8182) 631-527")
        )
    ]

    func handleContactTap(item: ContactModel) {
        switch item.type {
        case .web(let web):
            openWeb(web)
        case .mail(let mail):
            openMail(mail)
        case .map:
            openMap()
        case .phone(let phone):
            openPhone(phone)
        }
    }

    private func openWeb(_ web: String) {
        UIApplication.shared.open(URL(string: web)!, options: [:], completionHandler: nil)
    }

    private func openMap() {
        let latitude: CLLocationDegrees = Double(64.59625669689088)
        let longitude: CLLocationDegrees = Double(40.71436889798673)
        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.openInMaps(launchOptions: options)
    }

    private func openMail(_ web: String) {
        let email = "mailto:\(web)"
        UIApplication.shared.open(URL(string: email)!, options: [:], completionHandler: nil)
    }

    private func openPhone(_ web: String) {
        let number = web.components(separatedBy: .decimalDigits.inverted).joined()
        UIApplication.shared.open(URL(string: "tel://+\(number)")!, options: [:], completionHandler: nil)
    }
}
