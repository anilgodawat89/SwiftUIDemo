//
//  NavigationView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 20/07/24.
//

import SwiftUI

struct NavigationBarView: View {

    enum RightIconType {
        case support
        case info
    }
    // MARK: - Properties
    var leftIcon: String
    var rightIcon: String

     var rightIconState: RightIconType = .support
     var isBackButtonShow: Bool = true
    @State private var isAnimated: Bool = false
    @EnvironmentObject private var coordinator: Coordinator

    // MARK: - Body
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                // MARK: - Search Button
                if isBackButtonShow {
                    Button(action: {
                        coordinator.pop()

                    }, label: {
                        Image("navigation-back-arrow")

                    }).padding(.leading, 20) // End of Button
                } else {
                    Button(action: {}, label: {
                        Image("circle-question")
                    }) // End of Button
                }

                Spacer()
                // MARK: - Logo
                Image("navigationLogo", bundle: nil)
                Spacer()
                // MARK: - Cart Button
                Button(action: {}, label: {
                    Image("circle-question")
                }).padding(.trailing, 20) // End of Button
            }.background(.white)

            Divider().background(.gray)
        } .padding(0)// End of HStack
    }
}

// MARK: - Preview
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(leftIcon: "pencil", rightIcon: "eraser")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
