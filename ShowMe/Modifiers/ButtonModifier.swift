//
//  ButtonModifier.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-08-12.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(3)
            .foregroundColor(.white)
            .background(Color("ColorCustomLightPurple"))
            .cornerRadius(12)
            .padding()
    }
}
