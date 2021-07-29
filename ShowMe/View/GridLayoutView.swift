//
//  GridLayoutView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-27.
//

import SwiftUI

struct GridLayoutView: View {
    
    // MARK: - PROPERTIES
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 400), spacing: 12), count: 3)
    @EnvironmentObject var fetchResultsData: FetchResultsViewModel
    
    // MARK: - BODY
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 12, content: {
            ForEach(fetchResultsData.imagesData ?? []) { item in
                Image("default")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        }) //: GRID
        .padding(.horizontal)
    }
}

// MARK: - PREVIEW

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayoutView().environmentObject(FetchResultsViewModel())
    }
}
