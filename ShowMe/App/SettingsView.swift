//
//  SettingsView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-08-12.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isOnboarding = true
            }, label: {
                Text("Reset App")
            })
            Spacer()
        }
        .modifier(ButtonModifier())
    }
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
