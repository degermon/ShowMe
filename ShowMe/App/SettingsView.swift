//
//  SettingsView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-08-12.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            VStack {
                // MARK: - FORM
                Form {
                    // MARK: - SECTION 1
                    Section(header: Text("Actions")) {
                        HStack {
                            Spacer()
                            Button(action: {
                                isOnboarding = true
                            }, label: {
                                Text("Reset App")
                            })
                            Spacer()
                        } //: HSTACK
                        .modifier(ButtonModifier())
                    } //: SECTION 1
                    // MARK: - SECTION 2
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "ShowMe")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Daniel Š.")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Daniel Š.")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    } //: SECTION 2
                } //: FORM
                .listStyle(GroupedListStyle())
                
                // MARK: - FOOTER
                Text("Copyright © All rights reserved.")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            } //: VSTACK
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color("ColorCustomLightPurple"))
                })
            )
            .navigationBarTitle("Settings", displayMode: .automatic)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
