//
//  LinkButtonView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 30/07/24.
//

import Foundation
import SwiftUI
struct LinkButton: View {
    var title: String = ""
    var showUnderline = true
    var action: () -> Void
    var forgroundColor = ThemeManager.sharedThemeManager.selectedTheme.primaryLinkColor
    var body: some View {
        Button(action: action) {
            Text(title)
                .applyTextStyle(theme.primaryLinkButtonStyle)
                .underline()
        }
    }
}

#Preview {
    LinkButton(title: "Primary Policy") {

    }
}





