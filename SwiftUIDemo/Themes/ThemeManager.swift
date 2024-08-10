//
//  ThemeManager.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 24/07/24.
//

import Foundation
import SwiftUI
/**
 Theme Manager
 */
class ThemeManager: ObservableObject {
    public static let sharedThemeManager =  ThemeManager()
    public var selectedTheme: ThemeProtocol = TexasTheme()
    func setTheme(_ theme: ThemeProtocol) {
        selectedTheme = theme
    }
}
