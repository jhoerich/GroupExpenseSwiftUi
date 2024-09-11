//
//  LoadingView.swift
//  GroupExpense
//
//  Created by Janek Höricht on 11.09.24.
//

import SwiftUI

struct LoadingView: View {
    let titleText : String
    var body: some View {
        ZStack {
            Color.gray.opacity(0.4)
            ProgressView(label:{
                Text(self.titleText)
            })
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    LoadingView(titleText: "Anmelden")
}
