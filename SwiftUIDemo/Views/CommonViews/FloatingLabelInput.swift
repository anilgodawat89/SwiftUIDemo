//
//  FlotingTextFieldView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 21/07/24.
//


import Foundation
import SwiftUI


// A TextField view
///  `Parameters`
///  `value` :  accepts Binding of String which controls the text in TextField
///  `placeholder` : Placeholder for TextField
///  `isPasswordField` : Flag to make TextField secure text entry
///  `isShowingPassword`: Indicator for if a TextField is showing password or not
///

public struct FloatingLabelInput: View {

    @Binding var value: String
    private let placeholder: String
    private let isPasswordField: Bool
    @State private var isShowingPassword: Bool = false

    public init(value: Binding<String>, placeholder: String, isPasswordField: Bool = false) {
        self._value = value
        self.placeholder = placeholder
        self.isPasswordField = isPasswordField
    }

    public var body: some View {
        VStack {
            ZStack {
                HStack {
                    Text(placeholder)
                        .foregroundColor(value.isEmpty ? .DELightGray : theme.primaryTextColor)
                        .font(value.isEmpty ? .custom(theme.fontNames.regular, size: ConstantStrings.CommonStrings.primaryFontSize) : .custom(theme.fontNames.regular, size: 12))
                        .offset(x: 0, y: value.isEmpty ? 0 : -15)
                        .transition(.slide)
                        .transition(.scale)
                    
                    Text("*")
                        .foregroundColor(theme.primaryErrorColor).offset(y: value.isEmpty ? 0 : -15)
                    Spacer()
                }
                .animation(.easeIn(duration: 0.1))

                HStack {
                    if isPasswordField && !isShowingPassword {
                        SecureField("", text: $value).offset(y: 5)
                    } else {
                        TextField("", text: $value).offset(y: 5)
                    }
                    if isPasswordField {
                        Button {
                            isShowingPassword.toggle()
                        } label: {
                            if isShowingPassword {
                                Image(ConstantStrings.ImageNames.hidePassword)
                            } else {
                                Image(ConstantStrings.ImageNames.showPassword)
                            }
                        }
                    }
                }
            }
            .padding(ConstantStrings.CommonStrings.globalPadding)
            .padding(.leading, 10)
        }

        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(theme.buttonPrimaryText, lineWidth: theme.buttonBorderWidth)
        )
    }
}

#Preview {
    // Using a State variable for preview
    ZStack {
        @State var sampleValue: String = "Hello"
        FloatingLabelInput(value: $sampleValue, placeholder: "Test", isPasswordField: false)
    }
}




//public struct FloatingLabelInput: View {
//
//    final class Model: ObservableObject {
//        @Published var text: String = ""
//        var placeholder: String = ""
//        var currentValue: String = ""
//        var isPasswordField: Bool = false
//        @Published var isShowingPassword: Bool = false
//        var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
//
//        init() {
//            self.$text
//                .sink(receiveValue: { value in
//                    self.currentValue = value
//                })
//                .store(in: &cancellables)
//
//        }
//    }
//
//
//    @ObservedObject var model: FloatingLabelInput.Model = FloatingLabelInput.Model()
//    
//    
//    public init(placeholder: String, title: String, isPasswordField: Bool = false) {
//        self.model.placeholder = placeholder
//        self.model.text = title
//        self.model.isPasswordField = isPasswordField
//    }
//
//
//    public var body: some View {
//        VStack {
//            ZStack {
//                HStack {
//                    Text(self.model.placeholder)
//                        .font(self.model.currentValue.isEmpty ? .custom(theme.fontNames.regular, size: ConstantStrings.CommonStrings.primaryFontSize) : .custom(theme.fontNames.regular, size: 12))
//                        .foregroundColor(self.model.currentValue.isEmpty ? .DEBlackOut : .DEBlackOut)
//                        .offset(x: 0,y: self.model.currentValue.isEmpty ? 0 : -15)
//                        .transition(.slide)
//                        .transition(.scale)
//                    Text("*").foregroundColor(theme.primaryErrorColor).offset(y:self.model.currentValue.isEmpty ? 0 : -15 )
//
//                    Spacer()
//
//                }
//                .animation(.easeIn(duration: 0.1))
//
//                HStack {
//                    if self.model.isPasswordField && !self.model.isShowingPassword {
//                        SecureField("", text: $model.text).offset(y: 5)
//                    } else {
//                        TextField("", text: self.$model.text).offset(y: 5)
//                    }
//                    if self.model.isPasswordField {
//                        Button {
//                            print("Button was tapped")
//                            self.model.isShowingPassword.toggle()
//                        } label: {
//                            if self.model.isShowingPassword {
//                                Image(ConstantStrings.ImageNames.hide_password)
//                            } else {
//                                Image(ConstantStrings.ImageNames.show_password)
//                            }
//                        }
//                    }
//
//                }
//
//
//            }.padding(ConstantStrings.CommonStrings.globalPadding)
//        }.background(.white).border(theme.buttonPrimaryBorderColor, width: 1).cornerRadius(4)
//
//    }
//}
//
//#Preview {
//    FloatingLabelInput(placeholder: "Test", title: "content")
//}
