//
//  NavigationManager.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 21/07/24.
//

import Foundation
import SwiftUI
final class NavigationManager: ObservableObject, Observable {

    public enum Destination: Codable, Hashable {
        case login
        case forgotUsername
        case register
    }

    @Published var navPath = NavigationPath()

    func navigate(to destination: Destination) {
        navPath.append(destination)
    }

    func navigateBack() {
        navPath.removeLast()
    }

    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
