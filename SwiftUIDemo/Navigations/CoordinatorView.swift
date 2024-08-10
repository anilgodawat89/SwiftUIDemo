//
//  CoordinatorView.swift
//  Coordinator
//
//  Created by Mayank Gupta on 20/07/24.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    @ObservedObject private var user = LoginViewModal()


    var body: some View {
        NavigationStack(path: $coordinator.path) {
            Group {
                switch coordinator.currentRoot {
                case .splash:
                    SplashView()
                case .authentication:
                    coordinator.build(page: .region)
                        .navigationDestination(for: AppPages.self) { page in
                            coordinator.build(page: page)
                        }
                        .sheet(item: $coordinator.sheet) { sheet in
                            coordinator.buildSheet(sheet: sheet)
                        }
                        .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                            coordinator.buildCover(cover: item)
                        }
                case .home:
                    coordinator.buildMain(page: .landingView)
                        .navigationDestination(for: MainPages.self) { page in
                            coordinator.buildMain(page: page)
                        }
                        .sheet(item: $coordinator.sheet) { sheet in
                            coordinator.buildSheet(sheet: sheet)
                        }
                        .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                            coordinator.buildCover(cover: item)
                        }
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
        .environmentObject(coordinator)
        .environmentObject(user)
    }
}
