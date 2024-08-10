//
//  View+Extension.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 25/07/24.
//

import Foundation
import SwiftUI

extension View {
    var theme: ThemeProtocol {
        return ThemeManager.sharedThemeManager.selectedTheme
    }

    func applyTextStyle(_ textStyle: DETextStyle) -> some View {
        modifier(textStyle)
    }

    /*func applyNavigationStyle(_ navStyle: DENavigationStyle) -> some View {
        modifier(navStyle)
    }*/

    func applyNavigationStyle( title: String, hideNavigationBar:Bool = false, showNavigationLogo: Bool = false, rightActionType: RightActionType = .none , hideBackButton: Bool = false ) -> some View {
        modifier(DENavigationStyle(navigationTitle: title, hideNaivgationBar: hideNavigationBar, showNaviationLogo: showNavigationLogo, rightActionType: rightActionType, hideBackButton: hideBackButton))
    }


    /*func onFirstAppear(perform: @escaping () -> Void) -> some View {
        return self.modifier(OnFirstAppearModifier(perform: perform))
    }*/

    /*func hideNavigation() -> some View {
        if #available(iOS 16, *) {
            return self.modifier(ToolbarHiddenViewModifier())
        } else {
            return self.modifier(NavigationBarHiddenViewModifier())
        }
    }*/
}
