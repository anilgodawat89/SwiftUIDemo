//
//  ForgotUsernameView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 21/07/24.
//

import SwiftUI

struct ForgotUsernameView: View {

    var body: some View {
        TabView {
            Text("First Tab").tabItem { Label("Home", systemImage: "list.dash") }
            Text("Second Tab").tabItem { Label("Home", systemImage: "list.dash") }
        }
    }
}

#Preview {
    ForgotUsernameView()
}
