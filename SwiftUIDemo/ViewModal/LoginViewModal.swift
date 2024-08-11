//
//  LoginViewModal.swift
//  SwiftUIDemo
//
//  Created by Latha on 31/07/24.
//

import Foundation
import SwiftUI
//import Login
//import Common

enum PermissionType {
    case pushNotification
    case faceId
    case none
}

class LoginViewModal: ObservableObject {

    @Published var username: String = "Aditya.mandal"
    @Published var password: String = "OamStg@12345"
    //let keyChain = Keychain()
    @Published var permissionType: PermissionType = .pushNotification
    @Published var isLoggedIn = false;
    @Published var selectedRegion: RegionType = .none
    @AppStorage("isRegionSelected") var isRegionSelected: Bool = false
    @AppStorage ("isRememberMeSelected")  var isRememberMeSelected: Bool = false
    @AppStorage ("isFaceIdSelected")  var isFaceIdSelected = false
    @AppStorage ("Username") var savedUserName = ""
    @AppStorage("onboardingStatus") var isOnBoardingDone = false
    @AppStorage("promptForPushPermission") var promptForPushPermission: Bool = true
    @AppStorage("promptForBioMatric") var promptForBioMatrics: Bool = true

    init() {
        //NotificationCenter.default.post(name: NSNotification.Name(NotificationKeys.pushNotificationMessageDidShow), object: nil)
        UIApplication.shared.registerForRemoteNotifications()
    }

    var isValid: Bool {
        return !username.isEmpty && !password.isEmpty
    }

    var usernameTextFieldPlaceholder: String {
        ConstantStrings.AuthFlowStrings.usernameTextfieldPlaceholder
    }

    var passwordTextFieldPlaceholder: String {
        ConstantStrings.AuthFlowStrings.passwordTextfieldPlaceholder
    }

    var currentUserName: String {
        return isRememberMeSelected ? "\(ConstantStrings.AuthFlowStrings.welcomeUser) \(savedUserName)" : ConstantStrings.AuthFlowStrings.welcomeDirectEnergy
    }

    func handleRememberMe() {
        savedUserName = isRememberMeSelected ? username : ""
        /*if !isRememberMeSelected {
            isFaceIdSelected = false
            keyChain[AppKey.userName] = ""
            keyChain[AppKey.password] = ""
        } else {
            keyChain[AppKey.userName] = savedUserName
            keyChain[AppKey.password] = password
        }*/
    }

    func setPermissionStatus() {
        if promptForPushPermission {
            permissionType = .pushNotification
        } else if promptForBioMatrics {
            permissionType = .faceId
        } else {
            permissionType = .none
        }
    }

    /*func callLoginService(completion: @escaping CompletionHandler) {
        /*DirectEnergyNavigationManager.shared.login(username: username, password: password) { error in
            completion(error)
        }*/
    }*/
}

