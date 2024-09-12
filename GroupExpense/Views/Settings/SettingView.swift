//
//  SettingView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import Foundation
import SwiftUI

struct SettingView: View {
    let setting : Setting
    let selectedSheetAction : () -> Void
    
    var body: some View {
        if setting.type == .page {
            NavigationLink(value: setting, label: {
                setting.body.view
            })
        }else{
            HStack {
                Button(action: {
                    if setting.type == .sheet {
                       selectedSheetAction()
                    }
                    if let action = setting.action {
                        action()
                    }
                }) {
                    HStack{
                        if let textBody = setting.body as? SettingTextBody {
                            textBody.view
                        } else if let viewBody = setting.body as? SettingViewBody {
                            viewBody.view
                        }
                        if setting.type != .nothing{
                            Spacer()
                            Image(systemName: "chevron.right")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(Color(.systemGray3))
                        }
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    SettingView(
        setting: Setting(
            body: SettingTextBody(title: "Sprache", imageSystemName: "map"),
            destinationType: .settings,
            action: {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }),
        selectedSheetAction: {})
}
