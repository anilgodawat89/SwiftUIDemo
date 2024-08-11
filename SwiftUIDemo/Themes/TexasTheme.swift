//
//  DETheme.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 24/07/24.
//

import Foundation
import UIKit
import SwiftUI
/**
 Main Theme
 */
struct TexasTheme: ThemeProtocol {
    var constantStrings = ConstantStrings()
    //var brandAsset = BrandAssets()
    var fontNames: FontNames {
        FontNames(
            bold: "BasicSans-Bold",
            boldItalic: "BasicSans-Regular",
            heavy: "BasicSans-Bold",
            heavyItalic: "BasicSans-Regular",
            italic: "BasicSans-RegularIt",
            light: "BasicSans-Light",
            lightItalic: "BasicSans-LightIt",
            medium: "BasicSans-SemiBold",
            mediumItalic: "BasicSans-SemiBoldIt",
            regular: "BasicSans-Regular"
        )
    }
    var buttonBorderWidth: CGFloat = CGFloat(2.0)
    var buttonCornerRadius: CGFloat = CGFloat(5.0)
    var buttonPrimaryText: Color = .DEBlackOut
    var buttonPrimaryBackground:Color = .DEVioletLight
    var buttonSecondaryText:Color = .DEBlackOut
    var buttonSecondaryBackground:Color = .white
    var buttonDisableText:Color = .DEShadow
    var buttonDisableBackground:Color = .DEDim
    var buttonDisableBorderBackground:Color = .DEShadow
    var buttonDisableBorderColor: Color = .DEShadow
    var buttonPrimaryBorderColor:Color = .DEBlackOut
    var buttonSecondaryBorderColor:Color = .DEBlackOut


    var primaryTextColor: Color = .DEBlackOut
    var primaryLinkColor: Color = .DEDarkOrange
    var primaryErrorColor: Color = .DEDarkOrange
    var primaryBorderColor: Color = .DELightGray
    var primarySurfaceGray : Color = .DESurfaceGray


    var header1Style: DETextStyle {
        .init(fontName: fontNames.bold, size: 24, color: primaryTextColor)
    }

    var header2Style: DETextStyle {
        .init(fontName: fontNames.bold, size: 20, color: primaryTextColor)
    }

    var primaryTitleTextStyle: DETextStyle {
        .init(fontName: fontNames.regular, size: 16, color: primaryTextColor)
    }

    var linkButtonStyle: DETextStyle {
        .init(fontName: fontNames.medium, size: 16, color: primaryTextColor)
    }

    var header5Style: DETextStyle {
        .init(fontName: fontNames.regular, size: 12, color: primaryTextColor)
    }

    var primaryLinkButtonStyle: DETextStyle {
        .init(fontName: fontNames.medium, size: 16, color: primaryLinkColor)
    }


}

public extension UIColor {
    static func assetColor(_ name: String) -> UIColor {
        UIColor(named: name) ?? .black
    }
    var color: Color {Color(self)}
}

extension Color  {
    static func assetColor(_ name: String) -> Color {
       return  Color(name)
    }

    static var DEBlackOut: Color {
        return Color("TXBlackout")
    }

    static var DEVioletLight: Color {
        return Color("TXVioletLight")
    }

    static var DEShadow: Color {
        return Color("TXShadow")
    }

    static var DEDim: Color {
        return Color("TXDim")
    }

    static var DEDarkOrange: Color {
        return Color("TXDarkOrange")
    }

    static var DESurfaceGray: Color {
        return Color("TXSurfaceGray")
    }

    static var DELightGray: Color {
        return Color("TXGrayLight")
    }
}

extension UIColor {


    /*static var TXBlackOut: UIColor {
        return UIColor(named: "TXBlackOut") ?? .black
    }

    static var TXVioletLight: UIColor {
        return UIColor(named: "TXVioletLight") ?? .black
    }*/


    /*static var DEGrayOut -> UIColor {
        return UIColor(named: "DEGrayout") ?? .darkGray
    }
    public class func DEBlackout() -> UIColor {
        return UIColor(named: "DEBlackout") ?? .black
    }

    public class func DEVioletLight() -> UIColor {
        return UIColor(named: "DEVioletLight") ?? .black
    }
    public class func DEVioletDark() -> UIColor {
        return UIColor(named: "DEVioletDark") ?? .black
    }

    class func DEDarkYellow() -> UIColor {
        return UIColor(named: "DEDarkYellow") ?? .white
    }
    class func DEOrange() -> UIColor {
        return UIColor(named: "DEOrange") ?? .orange
    }

    public class func DEShadow() -> UIColor {
        return UIColor(named: "DEShadow") ?? .black
    }
    public class func DEDim() -> UIColor {
        return UIColor(named: "DEDim") ?? .black
    }

    public class func DEPureWhite() -> UIColor {
        return UIColor(named: "DEPureWhite") ?? .black
    }
    public class func DELightGreen() -> UIColor {
        return UIColor(named: "DELightGreen") ?? .black
    }

    public class func DEDarkOrange() -> UIColor {
        return UIColor(named: "DEDarkOrange") ?? .black
    }

    public class func DEGrayLight() -> UIColor {
        return UIColor(named: "DEGrayLight") ?? .black
    }

    public class func DEDarkGreen() -> UIColor {
        return UIColor(named: "DEDarkGreen") ?? .black
    }

    public class func DEYellow() -> UIColor {
        return UIColor(named: "DEYellow") ?? .black
    }

    public class func DEMidYellow() -> UIColor {
        return UIColor(named: "DEMidYellow") ?? .black
    }

    public class func DELightOrange() -> UIColor {
        return UIColor(named: "DELightOrange") ?? .black
    }*/
}


public struct FontNames {
    let bold: String
    let boldItalic: String
    let heavy: String
    let heavyItalic: String
    let italic: String
    let light: String
    let lightItalic: String
    let medium: String
    let mediumItalic: String
    let regular: String

    public init(bold: String, boldItalic: String, heavy: String, heavyItalic: String, italic: String, light: String, lightItalic: String, medium: String, mediumItalic: String, regular: String) {
        self.bold = bold
        self.boldItalic = boldItalic
        self.heavy = heavy
        self.heavyItalic = heavyItalic
        self.italic = italic
        self.light = light
        self.lightItalic = lightItalic
        self.medium = medium
        self.mediumItalic = mediumItalic
        self.regular = regular
    }
}


