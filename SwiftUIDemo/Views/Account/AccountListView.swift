//
//  AccountListView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 31/07/24.
//

import SwiftUI

struct AccountListView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var viewModal: LoginViewModal


    var body: some View {
        GeometryReader { reader in
            VStack {
                List {
                    accountListCellView()
                    accountListCellView()
                    accountListCellView()
                    accountListCellView()
                }.listRowSeparator(.visible)
                    .listStyle(.plain)
            }.applyNavigationStyle(title: "Select Account", rightActionType: .close, hideBackButton: true)
        }
    }

    func accountListCellView() -> some View {
        let content = HStack {
            Text("19419 HARVEST STREAM WAY").applyTextStyle(theme.header2Style).padding(10)
            Text("Web Exclusive").applyTextStyle(theme.header2Style).background(RoundedRectangle(cornerRadius: 10, style: .circular)).foregroundColor(.yellow)
            Button(action: {
                //viewModal.isLoggedIn = true
                coordinator.path = NavigationPath()
                coordinator.currentRoot = .home
            }, label: {
                Image(ConstantStrings.ImageNames.support)
            })
        }
        return AnyView(content)
    }
}

#Preview {
    AccountListView()
}
