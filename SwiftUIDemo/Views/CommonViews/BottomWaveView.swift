//
//  BottomWaveView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 21/07/24.
//

import SwiftUI

struct BottomWaveView: View {
    var body: some View {
        ZStack {
            Image(ConstantStrings.ImageNames.wave).resizable().ignoresSafeArea(.all).frame(height: 100).overlay(alignment: .center) {
                VStack(spacing: 5) {
                    Text("v.X.X.X")
                    Text(ConstantStrings.AuthFlowStrings.bottomWaveRights)
                    HStack(spacing: 5) {
                        Text(ConstantStrings.AuthFlowStrings.puctCertifictate)
                        LinkButton(title: ConstantStrings.AuthFlowStrings.bottomWavePrivacyPolicy) {
                        }
                    }
                }.padding(.top, 50)
                    .applyTextStyle(theme.header5Style)
            }
        }
    }
}

#Preview {
    BottomWaveView()
}
