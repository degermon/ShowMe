//
//  OnboardingViewImage.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-25.
//

import SwiftUI

struct OnboardingViewImage: View {
    var body: some View {
        Image("inquisitive-chibi")
            .resizable()
            .scaledToFit()
            .padding(15)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color("ColorCustomLightBlue"), lineWidth: 5))
            .shadow(radius: 7)
    }
}

struct OnboardingImageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewImage()
    }
}
