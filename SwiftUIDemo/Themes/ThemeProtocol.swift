//
//  ThemeProtocol.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 24/07/24.
//

import Foundation
import SwiftUI
/**
 Protocol for themes
 */
protocol ThemeProtocol {
    var fontNames: FontNames { get }
    //Buttons-Primary
    var buttonPrimaryText: Color { get }
    var buttonPrimaryBackground: Color { get }
    var buttonPrimaryBorderColor: Color { get }
    //Button- Secondary
    var buttonSecondaryText: Color { get }
    var buttonSecondaryBackground: Color { get }
    var buttonSecondaryBorderColor: Color { get }
    //Button -- Disable
    var buttonDisableText: Color { get }
    var buttonDisableBackground: Color { get }
    var buttonDisableBorderBackground: Color { get }
    var buttonDisableBorderColor: Color {get }
    // Button- Common Properties
    var buttonBorderWidth: CGFloat { get }
    var buttonCornerRadius: CGFloat { get }
    //Link Button
    var primaryLinkColor: Color { get }
    var primaryErrorColor: Color { get }
    var primaryTextColor: Color { get }
    //Border Color
    var primaryBorderColor: Color { get }
    var primarySurfaceGray: Color { get }


    var header1Style: DETextStyle { get }
    var header2Style: DETextStyle { get }
    var header5Style: DETextStyle { get }
    var primaryTitleTextStyle: DETextStyle { get }
    var primaryLinkButtonStyle: DETextStyle { get }

    var constantStrings: ConstantStrings { get }
}
