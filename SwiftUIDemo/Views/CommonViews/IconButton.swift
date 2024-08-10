//
//  IconButtonView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 10/08/24.
//

import SwiftUI

import Foundation
import SwiftUI
struct IconButton: View {
    enum Position {
        case left
        case right
        case none
    }
    var action: () -> Void
    var icon: String
    var title: String
    var position: Position  = .none
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack{
                if position == .none {
                    Image(icon).resizable()
                } else if position == .left {
                    Image(icon)
                    Text(title)
                } else if position == .right {
                    Text(title).foregroundStyle(.txDarkOrange)
                    Image(icon).resizable()
                }
            }

        })
    }
}

#Preview {
    IconButton(action: {

    }, icon: ConstantStrings.ImageNames.locationRed, title: "", position: .left)
}
