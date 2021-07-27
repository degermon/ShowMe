//
//  GridLayout.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-27.
//

import SwiftUI

struct GridLayout: View {
    
    // MARK: - PROPERTIES
    
    var gridItemLayout = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 400), spacing: 12), count: 3)
    @Binding var showMe: String
    
    // MARK: - BODY
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 12, content: {
            ForEach(0..<20, id: \.self) { item in
                Text(showMe)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                    .background(Color("ColorCustomLightPurple"))
            }
            .padding()
        }) //: GRID
        .padding(.horizontal)
    }
}

// MARK: - PREVIEW

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayout(showMe: .constant("Testing"))
    }
}
