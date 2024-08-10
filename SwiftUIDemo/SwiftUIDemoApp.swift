//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 20/07/24.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    @ObservedObject var navigationManager = NavigationManager()
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
            /*NavigationStack(path: $navigationManager.navPath) {
                ContentView()
                    .navigationDestination(for: NavigationManager.Destination.self) { destination in
                        switch destination {
                        case .login:
                            LoginView()
                        case .forgotUsername:
                            ForgotUsernameView()
                        default:
                            Text("D")
                        }
                    }
            }
            .environment(navigationManager)*/
        }
    }
}
