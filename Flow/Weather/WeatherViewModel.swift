//
//  WeatherViewModel.swift
//  arhAirport (iOS)
//
//  Created by Никита Иванов on 07.03.2022.
//

import Foundation

final class WeatherViewModel: ObservableObject {

    let exampleWeather: [WeatherCellModel] = [
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с"),
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с"),
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с"),
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с"),
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с"),
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с"),
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с"),
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с"),
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с"),
        .init(time: "12:44", weatherIcon: Resources.Images._01n.image, temperature: "-4", windSpeed: "2 м/с"),
        .init(time: "11:43", weatherIcon: Resources.Images._02n.image, temperature: "-6", windSpeed: "4 м/с"),
        .init(time: "10:43", weatherIcon: Resources.Images._02n.image, temperature: "23", windSpeed: "12 м/с"),
        .init(time: "9:42", weatherIcon: Resources.Images._02n.image, temperature: "-4", windSpeed: "4 м/с")
    ]
}
