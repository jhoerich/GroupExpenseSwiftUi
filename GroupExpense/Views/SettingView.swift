//
//  SettingView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import SwiftUI

struct SettingView: View {
    @State var setting: Setting? = nil
    
    var body: some View {
        let sections = createSettings()
        NavigationStack {
            List {
                ForEach(sections, id: \.self) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.settings, id: \.self) { setting in
                            VStack(alignment: .leading) {
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(Color(.systemGray6))
                                    
                                    VStack {
                                        if let view = setting.view {
                                            view
                                        } else {
                                            Button(action: {
                                                self.setting = setting
                                            }, label: {
                                                HStack {
                                                    if !setting.imageSystemName.isEmpty {
                                                        setting.getImage()
                                                            .foregroundStyle(Color(.systemGray))
                                                    }
                                                    Text(setting.title)
                                                        .foregroundColor(setting.color)
                                                }
                                            })
                                        }
                                    }
                                    .padding(.leading, 5)
                                }
                            }.listRowSeparator(.hidden)  
                        }
                    }
                }
            }
            .sheet(item: $setting) { setting in
                if let destinationView = setting.destinationView {
                    destinationView
                } else {
                    Text("Kein Ziel festgelegt")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .scrollContentBackground(.hidden)
        }
    }
    
    func createSettings() -> [SectionSetting] {
        var kontoSection = SectionSetting(title: String(localized: "Konto"), settings: [])
        var anmedlungSection = SectionSetting(title: String(localized: "registration"), settings: [])
        
        anmedlungSection.settings.append(Setting(view: {
            Button(action: {
                AuthenticationHelper.instance.logout()
            }, label: {
                Text(String(localized: "logout"))
                    .foregroundStyle(.red)
            })
        }))
        
        let benutzerKontoSetting = Setting(title: "Benutzerkonto", image: "person", destinationView: {
            VStack {
                Text("Hello World")
            }
        })
        let spracheKontoSetting = Setting(title: "Sprache", image: "map", destinationView: {
            VStack {
                Text("Sprache")
            }
        })
        
        kontoSection.settings = [benutzerKontoSetting, spracheKontoSetting]
        
        return [kontoSection, anmedlungSection]
    }
}

#Preview {
    SettingView()
}
