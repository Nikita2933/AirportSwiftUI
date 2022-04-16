//
//  DepartureViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import Foundation

final class DepartureViewModel: ObservableObject {
    let exampleList: [DepartureCellModel] = [
        .init(
            departureTime: "8:20",
            aviaCompany: "Победа",
            reisName: "MH-17",
            flyDirection: "Archangelsk",
            statusLabel: "wait"
        ),
        .init(
            departureTime: "8:30",
            aviaCompany: "Победа",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: "wait"
        ),
        .init(
            departureTime: "7:10",
            aviaCompany: "Победа1",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: "wait"
        ),
        .init(
            departureTime: "7:10",
            aviaCompany: "Победа2",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: "succes"
        ),
        .init(
            departureTime: "7:10",
            aviaCompany: "Победа3",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: nil
        ),
        .init(
            departureTime: "7:10",
            aviaCompany: "Победа4",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: "wait"
        ),
        .init(
            departureTime: "7:10",
            aviaCompany: "Победа6",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: "wait"
        ),
        .init(
            departureTime: "7:10",
            aviaCompany: "Победа5",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: nil
        ),
        .init(
            departureTime: "7:10",
            aviaCompany: "Победа7",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: "wait"
        ),
        .init(
            departureTime: "3:10",
            aviaCompany: "Победа2",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: nil
        ),
        .init(
            departureTime: "12:10",
            aviaCompany: "Победа2",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: "wait"
        ),
        .init(
            departureTime: "7:10",
            aviaCompany: "Победа1",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: nil
        ),
        .init(
            departureTime: "7:10",
            aviaCompany: "Победа1",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: "wait"
        ),
        .init(
            departureTime: "8:10",
            aviaCompany: "Победа2",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: nil
        ),
        .init(
            departureTime: "22:10",
            aviaCompany: "Победа",
            reisName: "MH-22",
            flyDirection: "Kaliningrad",
            statusLabel: "wait"
        ),

    ]
}


