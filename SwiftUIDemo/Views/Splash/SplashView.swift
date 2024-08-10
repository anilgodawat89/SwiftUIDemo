//
//  SplashView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 04/08/24.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var coordinator: Coordinator
    var body: some View {
        VStack {
            Image("logo").resizable().frame(width: 300, height: 300)
        } .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.spring()) {
                    coordinator.currentRoot = .authentication
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
