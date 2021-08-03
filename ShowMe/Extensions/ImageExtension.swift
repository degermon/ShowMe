//
//  ImageExtension.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-08-03.
//

import SwiftUI

extension Image {
    func imageIconModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
}
