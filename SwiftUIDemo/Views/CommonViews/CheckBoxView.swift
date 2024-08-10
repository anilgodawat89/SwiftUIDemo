//
//  CheckboxView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 21/07/24.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool
    var title: String
    var action: () -> Void

    var body: some View {
        HStack {
            Image(checked ? ConstantStrings.ImageNames.checkboxSelectedActive : ConstantStrings.ImageNames.checkboxUnselectedActive)
                .onTapGesture(perform: {
                    self.checked.toggle()
                    action()
                })

            Text(title).applyTextStyle(theme.primaryTitleTextStyle)
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false
        @State var title = ""

        var body: some View {
            CheckBoxView(checked: $checked, title: title) {

            }
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
