//
//  LoginViewModal.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 31/07/24.
//

import Foundation
import SwiftUI

class LoginViewModal: ObservableObject {
    
    @Published var username: String = "Anil"
    @Published var password: String = "OamStg@12345"
    @AppStorage ("RememberMe")  var rememberMe = false
    @AppStorage ("Username") var savedUserName = ""
    @AppStorage("onboardingStatus") var isOnBoardingDone = false;
    @Published var isLoggedIn = false;
    @Published var selectedRegion: RegionType = .none
    @AppStorage("isRegionSelected") var regionSelected: Bool = false


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
        return rememberMe ? "\(ConstantStrings.AuthFlowStrings.welcomeUser) \(savedUserName)" : ConstantStrings.AuthFlowStrings.welcomeDirectEnergy
    }

    func handleRememberMe(){
        savedUserName = rememberMe ? username : ""
    }


}
