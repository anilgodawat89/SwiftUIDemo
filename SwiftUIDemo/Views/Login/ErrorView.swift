//
//  ErrorView.swift
//  SwiftUIDemo
//
//  Created by Anil Jain on 11/08/24.
//

import SwiftUI

struct ErrorView: View {

    var errorViewModal  = ErrorViewModal.sharedViewModal

    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        VStack(spacing:15) {
            Spacer()
            Image(ConstantStrings.ImageNames.logo)
            Image(errorViewModal.errorIcon)
            Text(errorViewModal.errorDetails.title).applyTextStyle(theme.header2Style).multilineTextAlignment(.leading)
            Text(errorViewModal.errorDetails.description).applyTextStyle(theme.primaryTitleTextStyle)

            buttonActionView()
        }.padding().background()
            .applyNavigationStyle(title: errorViewModal.errorNavigtionTitle, rightActionType: .close, hideBackButton: true)
    }

    func buttonActionView() -> some View {
        let contentView = VStack {
            switch ErrorViewModal.sharedViewModal.errorType {
            case .appLoadFail, .scheduleUpgrade:
                VStack {
                    Group {
                        PrimaryButton(title: errorViewModal.errorActions.primary) {

                        }
                        SecondayButton(title: errorViewModal.errorActions.secondary) {
                        }
                    }
                }
            case .outage:
                VStack {
                    Group {
                        PrimaryButton(title: errorViewModal.errorActions.primary, leftIcon: ConstantStrings.ImageNames.chatIcon, action: {
                        })
                        SecondayButton(title: errorViewModal.errorActions.secondary, leftIcon: ConstantStrings.ImageNames.phoneIcon) {

                        }
                    }
                }
            case .requireForceUpdate, .updateRecommended:
                    Group {
                        PrimaryButton(title: errorViewModal.errorActions.primary, rightIcon: ConstantStrings.ImageNames.arrowRightRegular, action: {
                        })
                        if ErrorViewModal.sharedViewModal.errorType == .updateRecommended {
                            LinkButton(title: errorViewModal.errorActions.secondary, action: {
                                coordinator.dismissCover()
                            })
                        }
                    }
            default:
                Text("")
            }
        }.frame(maxHeight: .infinity, alignment: .bottom)
        return AnyView(contentView)
    }

}

#Preview {
    ErrorView()
}

