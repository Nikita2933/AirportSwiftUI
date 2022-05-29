//
//  ContentView.swift
//  Shared
//
//  Created by Никита Иванов on 07.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State var tabState: RootTabView = .arrival

    init() {
        let navBArAppearance = UINavigationBarAppearance()
        navBArAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        navBArAppearance.backgroundColor = UIColor(Color.accentColor)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = navBArAppearance
        UINavigationBar.appearance().compactAppearance = navBArAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBArAppearance
        UITextView.appearance().isScrollEnabled = false
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .gray

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $tabState) {
            ArrivalPageView()
                .tabItem({
                    Text(LocalizableStrings.Arrival.title)
                    Image(uiImage: Resources.Images.airplaneLanding.image)
                })
                .tag(RootTabView.arrival)
            DeparturePageView(tabSelection: .today)

                .tabItem {
                    VStack {
                        Text(LocalizableStrings.Departure.title)
                        Image(uiImage: Resources.Images.airplaneTakeoff.image)
                    }
                    .tag(RootTabView.departure)
                }
            WeatherView()
                .tabItem {
                    VStack {
                        Text(LocalizableStrings.Weather.title)
                        Image(uiImage: Resources.Images.weatherPartlyCloudy.image)
                    }
                    .tag(RootTabView.weather)
                }
            ContactView()
                .tabItem {
                    VStack {
                        Text(LocalizableStrings.Contact.title)
                        Image(uiImage: Resources.Images.phone.image)
                    }
                    .tag(RootTabView.contact)
                }
        }
    }
}
