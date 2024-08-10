//
//  Coordinator.swift
//  Coordinator
//
//  Created by Mayank Gupta on 20/07/24.
//

import Foundation
import SwiftUI


class Coordinator: ObservableObject {
    enum AppRoots {
            case splash
            case authentication
            case home
        }

    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    @Published var currentRoot: AppRoots = .authentication

    func push(page: AppPages) {
        path.append(page)
    }

    func pushMain(page: MainPages) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .region: RegionView(regionType: .texas)
        case .login: LoginView()
        case .permission: PermissionView()
        default:
          Text("")
      }
    }


    @ViewBuilder
    func buildMain(page: MainPages) -> some View {
        switch page {
        case .landingView: LandingView()
        case .dashboardDetail: DashboardDetail()

        default:
          Text("")
      }
    }

    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .permission: PermissionView()
        }
    }
    
    @ViewBuilder
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .permission:
            NavigationStack {
                PermissionView()
            }
        case .selectAccountView: NavigationStack {
            AccountListView()
        }
        case .support:
            NavigationStack {
//                SupportMainView()
            }
        case .onboarding:
            OnboardingView()
        case .forgotusername: ForgotUsernameView()
        }

    }
}
