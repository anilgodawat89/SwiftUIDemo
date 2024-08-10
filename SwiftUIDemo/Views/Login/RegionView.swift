//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 20/07/24.
//

import SwiftUI

public enum RegionType {
    case texas
    case northEast
    case none
}

struct RegionView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = LoginViewModal()
    @State var regionType: RegionType = .none
    var isRegionSelected: Bool {
        return viewModel.regionSelected
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center,  spacing: ConstantStrings.CommonStrings.globalElementPadding) {
                Spacer(minLength: 100)
                AppLogoView()
                Text(ConstantStrings.AuthFlowStrings.regionVerfityTitle)
                    .frame( maxWidth: .infinity)
                    .applyTextStyle(theme.header1Style)
                    .multilineTextAlignment(.center)
                    .background(.red)

                VStack(spacing: ConstantStrings.CommonStrings.globalElementPadding) {
                    PrimaryButton(title: ConstantStrings.AuthFlowStrings.buttonTitleTaxas) {
                        viewModel.regionSelected = true
                        viewModel.selectedRegion = .texas
                        coordinator.push(page: .login)
                    }
                    SecondayButton(title: ConstantStrings.AuthFlowStrings.buttonTitleNortheast) {
                        viewModel.selectedRegion = .none
                    }
                }
                Spacer()
            }.padding(ConstantStrings.CommonStrings.globalPadding)
                .navigationBarHidden(true)
                .onAppear(perform: {
                    if isRegionSelected {
                        coordinator.push(page: .login)
                    }
                })
        }
    }}

#Preview {
    RegionView(regionType: .texas)
}
