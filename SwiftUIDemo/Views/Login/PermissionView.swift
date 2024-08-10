//
//  PermissionView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 26/07/24.
//

import SwiftUI

struct PermissionView: View {
    @State var  isShowLogo:Bool = false
    var body: some View {
        GeometryReader { geomatry in 
            VStack {
                Spacer()
                VStack(spacing: 15) {
                    Image("faceId").frame(width: 60, height: 60)
                    Text("Direct Energy would like to send you push notifications").applyTextStyle(theme.header1Style)
                        .multilineTextAlignment(.center)
                }.background(.gray)
                Spacer()
                VStack(spacing: 15) {
                    PrimaryButton(title: "Enable") {
                        self.isShowLogo = false
                    }
                    PrimaryButton(title: "Not Now") {
                        self.isShowLogo = true
                    }
                }
            }.padding(16)
                .applyNavigationStyle(title: "Permission")
        }
    }
}

#Preview {
    PermissionView()
}
