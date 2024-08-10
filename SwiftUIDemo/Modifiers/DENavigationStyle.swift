//
//  DENavigationStyle.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 28/07/24.
//

import Foundation
import SwiftUI

public enum RightActionType {
    case support
    case plus
    case close
    case none
}

public struct DENavigationStyle: ViewModifier {
    var navigationTitle: String = ""
    var hideNaivgationBar: Bool = false
    var showNaviationLogo:Bool = false
    var rightActionType:RightActionType  = .none
    var hideBackButton:Bool = false
    @EnvironmentObject private var coordinator: Coordinator

    public init(navigationTitle: String, hideNaivgationBar: Bool, showNaviationLogo: Bool, rightActionType: RightActionType, hideBackButton: Bool ) {
        self.navigationTitle = navigationTitle
        self.hideNaivgationBar = hideNaivgationBar
        self.showNaviationLogo = showNaviationLogo
        self.rightActionType = rightActionType
        self.hideBackButton = hideBackButton
    }

    public func body(content: Content) -> some View {
        content
            .navigationBarHidden(hideNaivgationBar)
            .navigationTitle(self.navigationTitle)
            .navigationBarBackButtonHidden(hideBackButton)
            .navigationBarTitleDisplayMode(.inline)
            .tint(.red)
        
           // .toolbarRole(.editor)
            .toolbar {
                if self.rightActionType == .support {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            // action
                            coordinator.presentFullScreenCover(.support)
                        } label: {
                            Image("circle-question").resizable().frame(width: 24, height: 24)
                        }
                    }
                } else if rightActionType == .close {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            self.coordinator.dismissCover()
                        } label: {
                            Image("circle-question").resizable().frame(width: 24, height: 24)
                        }
                    }
                }
                if self.showNaviationLogo {
                    ToolbarItem(placement: .principal){
                        Image(ConstantStrings.ImageNames.navigationLogo)
                        Color.clear
                    }
                }
                
            }.toolbarBackground(.visible, for: .navigationBar).toolbarBackground(.white, for: .navigationBar).tint(.red)

        if !hideNaivgationBar {
            Divider()
        }

    }
}
