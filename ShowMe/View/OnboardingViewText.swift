//
//  OnboardingViewText.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-25.
//

import SwiftUI

struct OnboardingViewText: View {
    var body: some View {
        Text("Show Me the World!")
            .font(.largeTitle)
            .padding()
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            .overlay(Capsule()
                        .stroke(Color("ColorCustomLightBlue"), lineWidth: 5)
            )
            .shadow(radius: 7)

    }
}

struct OnboardingScreenText_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewText()
            .background(Color.blue)
    }
}
