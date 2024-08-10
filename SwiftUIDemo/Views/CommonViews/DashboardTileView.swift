//
//  DashboardTileView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 04/08/24.
//

import SwiftUI

struct DashboardTileView: View {
    @State var title: String = ""
    @State var subTitle: String = ""
    var body: some View {
            VStack(spacing: 10) {
                HStack {
                    Image("circle-question")
                    Spacer()
                    Text("New").background(.yellow)
                }.background(.white)

                Text(title).applyTextStyle(theme.header1Style).multilineTextAlignment(.center).background(.orange).font(.subheadline)
                Text(subTitle).applyTextStyle(theme.primaryTitleTextStyle).frame(minHeight: 60, maxHeight: 60).background(.green)
                Text("Signup").background(.blue)
            }.padding(15).overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(theme.primaryBorderColor, lineWidth: 2)
            )
            
    }
}

#Preview {
    DashboardTileView(title: "Test user", subTitle: "Sing up today for netter check Sing up today for netter check")
}
