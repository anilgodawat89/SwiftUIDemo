//
//  DETextStyle.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 26/07/24.
//

import Foundation
import SwiftUI
public struct DETextStyle: ViewModifier {
    var fontName: String
    var size: CGFloat
    var color: Color

    public init(fontName: String, size: CGFloat, color: Color) {
        self.fontName = fontName
        self.size = size
        self.color = color
    }

    public func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .font(Font(UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)))
    }
}





