//
//  AppPages.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 27/07/24.
//


import Foundation

enum AppPages: Hashable {
    case region
    case login
    case permission
    case onboarding
    case selectAccountView

}

enum MainPages: Hashable {
    case landingView
    case dashboardDetail
}


enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }

    case permission
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    case onboarding
    case permission
    case forgotusername
    case selectAccountView
    case support

    //case signup
}
