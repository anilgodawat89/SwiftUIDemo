//
//  LandingView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 04/08/24.
//

import SwiftUI


struct LandingView: View {
    enum Tab {
        case home
        case bill
        case usage
        case offers
        case account
    }

    @EnvironmentObject private var coordinator: Coordinator
    @State private var selectedTab: Tab = .account

    var body: some View {
        TabView(selection: $selectedTab)
        {
            DashboardView().tabItem { Label("Home", systemImage: "list.dash") }.tag(Tab.home)
            DashboardView().tabItem { Label("Bill", systemImage: "list.dash") }.tag(Tab.bill)
            DashboardView().tabItem { Label("Usage", systemImage: "list.dash") }.tag(Tab.usage)
            DashboardView().tabItem { Label("Offers", systemImage: "list.dash") }.tag(Tab.offers)
            DashboardView().tabItem { Label("Account", systemImage: "list.dash") }.tag(Tab.account)
        }.edgesIgnoringSafeArea(.bottom).applyNavigationStyle(title: "home", hideNavigationBar: false, showNavigationLogo: false, rightActionType: .support)
            .tint(.purple)
    }

}


#Preview {
    LandingView()
}



struct DashboardDetail: View {
    var body: some View {
        VStack {
            Text("Dashbaord Dertail").background(.red).applyTextStyle(theme.primaryTitleTextStyle)
        }
    }
}
