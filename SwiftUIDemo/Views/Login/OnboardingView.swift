//
//  JourneyView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 28/07/24.
//

import SwiftUI

struct OnboardingView: View {

    @State var showTips: Bool = false
    @State private var currentPage = 1
    @StateObject private var viewModel = LoginViewModal()
    @EnvironmentObject private var coordinator: Coordinator

    let maxPage = 3
    var body: some View {
        GeometryReader { geomatry in
            VStack(spacing:15) {
                Spacer()
                if showTips {
                    TabView(selection: $currentPage)
                    {
                        VStack() {
                            VStack(){
                                Text("Discover")
                                Text("Your Elecirity Usage").padding(.bottom, 10)
                                Text("Learn Insight")
                                Text("Vew Weather")
                                Text("Vew Weather")
                            }
                            Image("tips_graph")
                        }.tag(1)

                        VStack() {
                            VStack(){
                                Text("View")
                                Text("Your Elecirity Usage").padding(.bottom, 10)
                            }
                            Image("tips_bill")
                        }.tag(2)

                        VStack() {
                            VStack(){
                                Text("Dashboard")
                                Text("Your Elecirity Usage").padding(.bottom, 10)
                            }
                            Image("tips_dashboard")
                        }.tag(3)

                    }.tabViewStyle(.page).indexViewStyle(.page(backgroundDisplayMode: .always))

                    VStack(spacing:15) {
                        if(currentPage < maxPage) {
                            PrimaryButton(title: "Next") {
                                currentPage += 1
                            }

                            LinkButton(title: "Skip to Dashboard") {
                                viewModel.isOnBoardingDone = true
                                handleLoginSuccess()
                            }.foregroundColor(.DEBlackOut)
                        } else {
                            PrimaryButton(title: "Done") {
                                viewModel.isOnBoardingDone = true
                                print("Done CLick")
                                handleLoginSuccess()
                            }
                        }


                    }.padding()

                } else {
                    Image("logo")
                    Image("tips_phone")
                    Text("Welcome to Direct Energy")
                    Text("Let’s show you how to get the most out of your Direct Energy app.").multilineTextAlignment(.center)
                    VStack(spacing:15) {
                        PrimaryButton(title: "View app tips") {
                            showTips = true
                        }

                        LinkButton(title: "Skip to Dashboard") {
                            viewModel.isOnBoardingDone = true
                            handleLoginSuccess()

                        }.foregroundColor(.DEBlackOut)
                    }.padding()
                }
            }

        }
    }

    func handleLoginSuccess() {
        if viewModel.isOnBoardingDone {
            coordinator.presentFullScreenCover(.selectAccountView)
        } else {
            coordinator.presentFullScreenCover(.onboarding)
        }
    }
}

#Preview {
    OnboardingView()
}
