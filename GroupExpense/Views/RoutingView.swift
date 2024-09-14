//
//  NavigationView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import SwiftUI

struct RoutingView: View {
    @State var selectedTab = 0
    
    var body: some View {
            VStack(spacing:0) {
                TabView(selection:$selectedTab) {
                    GroupUebersichtView()
                        .navigationTitle(String(localized: "groups"))
                        .tag(0)
                    
                    SettingSectionView()
                        .navigationTitle(String(localized: "settings"))
                        .tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                VStack {
                    Divider()
                        .frame(height: 1)
                    HStack {
                        VStack {
                            Image(systemName: "person.2")
                                .resizable()
                                .foregroundStyle(self.selectedTab == 0 ? .green : .gray)
                                .frame(width: 35, height: 25)
                                .padding(.top)
                        }.onTapGesture {
                            withAnimation(.snappy, {
                                self.selectedTab = 0
                            })
                        }.frame(maxWidth: .infinity)
                        VStack {
                            Image(systemName: "gear")
                                .resizable()
                                .foregroundStyle(self.selectedTab == 1 ? .green : .gray)
                                .frame(width: 30, height: 30)
                                .padding(.top)
                        }.onTapGesture {
                            withAnimation(.snappy, {
                                self.selectedTab = 1
                            })
                        }.frame(maxWidth: .infinity)
                    }.frame(maxHeight: 35)
                }
            }
    }
}

#Preview {
    RoutingView()
        .environment(GroupUebersichtViewModel())
        .environment(GroupErstellenViewModel())
}
