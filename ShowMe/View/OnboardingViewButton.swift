//
//  OnboardingViewButton.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-25.
//

import SwiftUI

struct OnboardingViewButton: View {
    
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - BODY
    
    var body: some View {
        Button(action: {
            isOnboarding = false
        }, label: {
            HStack(spacing: 8) {
                Text("Show Me!")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(20)
            .font(.largeTitle)
            .background(Capsule().strokeBorder(Color("ColorCustomLightBlue"), lineWidth: 5))
        }) //: BUTTON
        .accentColor(Color("ColorCustomLightBlue"))
    }
}

// MARK: - PREVIEW

struct OnboardingScreenText_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewButton()
            .background(Color.gray) // Just to better see the preview
            .previewLayout(.sizeThatFits)
    }
}
