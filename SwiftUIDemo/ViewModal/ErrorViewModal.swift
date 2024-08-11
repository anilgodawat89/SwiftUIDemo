//
//  ErrorViewModal.swift
//  DirectEnergy
//
//  Created by Anil Jain on 11/08/24.
//  Copyright © 2024 NRG. All rights reserved.
//

import Foundation

enum AppErrorType {
    case appLoadFail
    case outage
    case scheduleUpgrade
    case requireForceUpdate
    case updateRecommended
    case none
}

class ErrorViewModal: ObservableObject {
    @Published var errorType: AppErrorType = .none
    static let sharedViewModal = ErrorViewModal()


    var errorNavigtionTitle: String {
        switch errorType {
        case .appLoadFail:
            return ConstantStrings.ErrorFlowStrings.appLoadFailNavTitle
        case .outage:
            return ConstantStrings.ErrorFlowStrings.appDownMaintenanceNavTitle
        case .scheduleUpgrade:
            return ConstantStrings.ErrorFlowStrings.appImprovementNavTitle
        case .requireForceUpdate:
            return ConstantStrings.ErrorFlowStrings.appForceUpdateNavTitle
        case .updateRecommended:
            return ConstantStrings.ErrorFlowStrings.appUpdateRecommendedNavTitle
        default:
            return "Error"
        }
    }

    var errorIcon: String {
        switch errorType {
        case .appLoadFail:
            return ConstantStrings.ImageNames.swapIcon
        case .outage:
            return ConstantStrings.ImageNames.lampIcon
        case .scheduleUpgrade:
            return ConstantStrings.ImageNames.segwawIcon
        case .requireForceUpdate:
            return ConstantStrings.ImageNames.cellPhone
        case .updateRecommended:
            return ConstantStrings.ImageNames.cellPhone
        default:
            return ""
        }
    }
    var errorDetails: (title: String, description: String) {
        switch errorType {
        case .appLoadFail:
            return (title: ConstantStrings.ErrorFlowStrings.appLoadFailTitle, description: ConstantStrings.ErrorFlowStrings.appLoadFailDesc)
        case .outage:
            return (title: ConstantStrings.ErrorFlowStrings.appDownMaintenanceTitle, description: ConstantStrings.ErrorFlowStrings.appDownMaintenanceDesc)
        case .scheduleUpgrade:
            return (title: ConstantStrings.ErrorFlowStrings.appImprovementTitle, description: ConstantStrings.ErrorFlowStrings.appImprovementDesc)
        case .requireForceUpdate:
            return (title: ConstantStrings.ErrorFlowStrings.appForceUpdateTitle, description: ConstantStrings.ErrorFlowStrings.appForceUpdateDesc)
        case .updateRecommended:
            return (title: ConstantStrings.ErrorFlowStrings.appUpdateRecommendedTitle, description: ConstantStrings.ErrorFlowStrings.appUpdateRecommendedDesc)
        default:
            return (title: ConstantStrings.ErrorFlowStrings.appForceUpdateTitle, description: ConstantStrings.ErrorFlowStrings.appForceUpdateDesc)
        }
    }

    var errorActions: (primary: String, secondary: String) {
        switch errorType {
        case .appLoadFail, .scheduleUpgrade:
            return (primary: ConstantStrings.CommonStrings.closeButton, secondary: ConstantStrings.CommonStrings.ContactsUs)
        case .outage:
            return (primary: ConstantStrings.CommonStrings.chatWithAgent, secondary: ConstantStrings.CommonStrings.callDirectEnrgy)
        case .requireForceUpdate:
            return (primary: ConstantStrings.CommonStrings.updateApp, secondary: ConstantStrings.CommonStrings.updateApp)
        case .updateRecommended:
            return (primary: ConstantStrings.CommonStrings.updateApp, secondary: ConstantStrings.CommonStrings.skipForNow)
        default:
            return (primary: ConstantStrings.CommonStrings.closeButton, secondary: ConstantStrings.CommonStrings.ContactsUs)
        }
    }
}

