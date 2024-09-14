import SwiftUI

struct SettingSectionView: View {
    @State var selectedSheet: Setting? = nil
    
    var body: some View {
        let settings = createSettings()
        NavigationStack {
            List {
                ForEach(settings, id:\.id) {
                    section in
                    Section(section.title, content: {
                        ForEach(section.settings, id:\.id) {
                            setting in
                            SettingView(
                                setting: setting,
                                selectedSheetAction: {
                                    selectedSheet = setting
                                })
                        }
                    })
                    .listRowBackground(Color(.systemGray6))
                }
            }
            .scrollContentBackground(.hidden)
            .navigationDestination(
                for: Setting.self,
                destination: {
                    setting in
                    setting.destinationView
            })
            .sheet(
                item: self.$selectedSheet,
                content: {
                    setting in
                    setting.destinationView
                })
        }
    }
    
    func createSettings() -> [SectionSetting] {
        var kontoSection = SectionSetting(title: String(localized: "account"))
        var anmedlungSection = SectionSetting(title: String(localized: "registration"))
        
        anmedlungSection.settings.append(Setting(
            body: SettingTextBody(
                title: String(localized: "logout"),
                imageSystemName: "", color: .red),
            action: {
                withAnimation(.snappy, {
                    AuthenticationHelper.instance.logout()
                })
            }))
        
        kontoSection.settings.append(
            Setting(
                body: SettingTextBody(title: String(localized: "account"), imageSystemName: "person"),
                destinationType: .sheet,
                view: { VStack { Text("Benutzerkontod") }}))
        
        kontoSection.settings.append(
            Setting(
                body: SettingTextBody(title: String(localized: "language"), imageSystemName: "map"),
                destinationType: .settings,
                action: {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }))
        
        return [kontoSection, anmedlungSection]
    }
}

#Preview {
    SettingSectionView()
}
