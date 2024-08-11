//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by Latha on 20/07/24.
//

import SwiftUI
import LocalAuthentication
//import Login
//import Common


struct LoginView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var viewModel: LoginViewModal
    //static let keychain: Keychain = Keychain()
    @State private var checkRememberMe = false
    @State private var checkEnableFaceId = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack(spacing: 20 ) {
                    Text(ConstantStrings.AuthFlowStrings.texasCustomer)
                        .applyTextStyle(theme.header2Style)
                    VStack(spacing: 20) {
                        Text(viewModel.currentUserName).frame(maxWidth: .infinity, alignment: .leading)
                            .applyTextStyle(theme.primaryTitleTextStyle)
                        FloatingLabelInput(value: $viewModel.username, placeholder: viewModel.usernameTextFieldPlaceholder)
                        FloatingLabelInput(value: $viewModel.password, placeholder: viewModel.passwordTextFieldPlaceholder, isPasswordField: true)
                        checkBoxView()
                    }

                    HStack(spacing: 20) {
                        PrimaryButton(title: ConstantStrings.AuthFlowStrings.buttonLoginTitle, disabled: !viewModel.isValid) {
                            handleLoginSuccess()
                        }

                        IconButton(action: {

                        }, icon: ConstantStrings.ImageNames.faceId, title: "s", position: .none).frame(width: 45.0, height: 45)
                    }.padding(.top, 10)
                    HStack(spacing: 10){
                        Text(ConstantStrings.AuthFlowStrings.forgotTitle)
                        LinkButton(title: ConstantStrings.AuthFlowStrings.buttonUsernameTitle) {
                            print("Usernmae", $viewModel.username, $viewModel.password)
                        }
                        Text("or")
                        LinkButton(title: ConstantStrings.AuthFlowStrings.buttonPasswordTitle) {}
                    }

                    registerOptionsView()
                    Spacer()
                    notTaxasCustomer()
                }.padding(ConstantStrings.CommonStrings.globalPadding)
                Spacer()
                BottomWaveView()
            }.applyNavigationStyle(title: "", hideNavigationBar: false, showNavigationLogo: true, rightActionType: .support).background(theme.primarySurfaceGray)

        }.onAppear(perform: {
            /*if viewModel.promptForPushPermission {
                viewModel.permissionType = .pushNotification
                coordinator.presentFullScreenCover(.permission)
            } else if viewModel.promptForBioMatrics{
                viewModel.permissionType = .faceId
                coordinator.presentFullScreenCover(.permission)
            }*/
        })
    }

    func checkBoxView() -> some View {
       let contentView = HStack {
            CheckBoxView(checked: $viewModel.isRememberMeSelected, title: ConstantStrings.AuthFlowStrings.rememberMeTitle) {
                viewModel.handleRememberMe()
                print("remembet me clicked", viewModel.isRememberMeSelected)
            }
            Spacer()
           CheckBoxView(checked: $viewModel.isFaceIdSelected, title: ConstantStrings.AuthFlowStrings.enableFaceIdTitle) {
                print("faceId Clikced")
            }
        }
        return AnyView(contentView)

    }

    func forgotUsernamePasswordView() -> some View {
        let contentView  = HStack {
            Text("By tapping Done, you agree to the \(Text("[privacy policy](https://www.google.com)").underline()) and \(Text("[Terms and Conditions](https://www.google.com)").underline())")
                .tint(.green)
                         .padding()
        }
        return AnyView(contentView)
    }

    func notTaxasCustomer() -> some View {
        let contentView = HStack {
            VStack {
                IconButton(action: {
                    viewModel.isRegionSelected = false
                    coordinator.pop()
                }, icon: ConstantStrings.ImageNames.locationRed, title: ConstantStrings.AuthFlowStrings.buttonNotATaxasCustomer, position: .left)
            }.tint(theme.primaryLinkColor)
        }
        return AnyView(contentView)
    }

    // Register and options
    func registerOptionsView() -> some View {
        let contentView =
                HStack {
                    LinkButton(title:ConstantStrings.AuthFlowStrings.buttonRegisterTitle,  action: {
                        ErrorViewModal.sharedViewModal.errorType = .outage
                        coordinator.presentFullScreenCover(.errorView)
                    })
                    LinkButton(title: ConstantStrings.AuthFlowStrings.buttonEapanolTitle,  action: {
                        ErrorViewModal.sharedViewModal.errorType = .requireForceUpdate
                        coordinator.presentFullScreenCover(.errorView)

                    })
                    LinkButton(title: ConstantStrings.AuthFlowStrings.buttonSupportTitle,  action: {
                        ErrorViewModal.sharedViewModal.errorType  = .updateRecommended
                        coordinator.presentFullScreenCover(.errorView)
                    })
                }
        return AnyView(contentView)
    }

    func handleLoginSuccess() {
        //viewModel.callLoginService { error in
            //print("Error Login --", error)
            if viewModel.isOnBoardingDone {
             coordinator.presentFullScreenCover(.selectAccountView)
             } else {
             coordinator.presentFullScreenCover(.onboarding)
             }
       // }
    }
}

#Preview {
    LoginView()
}

