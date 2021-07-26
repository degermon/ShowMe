//
//  TransitionModifier.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-26.
//

import SwiftUI

struct TransitionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .transition(.move(edge: .trailing))
            .animation(.spring())
    }
}
