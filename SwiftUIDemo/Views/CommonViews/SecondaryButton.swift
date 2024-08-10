//
//  SecondaryButton.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 28/07/24.
//

import Foundation
import SwiftUI
struct SecondayButton: View {
    var title: String
    var disabled: Bool = false
    var action: () -> Void
    var height: CGFloat = 45
    var cornerRadius = ThemeManager.sharedThemeManager.selectedTheme.buttonCornerRadius

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 50)
                .foregroundColor(disabled ? theme.buttonDisableText : theme.buttonSecondaryText )
                .background(disabled ? theme.buttonDisableBackground : theme.buttonSecondaryBackground)
                .font(.custom(theme.fontNames.bold, size: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(disabled ? theme.buttonDisableBorderColor : theme.buttonSecondaryBorderColor, lineWidth: theme.buttonBorderWidth)
                )
        }
        .disabled(disabled)
    }
}
