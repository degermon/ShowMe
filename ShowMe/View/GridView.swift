//
//  GridView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-27.
//

import SwiftUI

struct GridView: View {
    
    // MARK: - PROPERTIES
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200), spacing: 8), count: 3)
    @EnvironmentObject var fetchResultsData: FetchResultsViewModel
    
    // MARK: - BODY
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 8, content: {
            ForEach(fetchResultsData.imagesData ?? []) { item in
                    GridItemView(item: item)
            }
            .padding(8)
        }) //: GRID
    }
}

// MARK: - PREVIEW

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridView().environmentObject(FetchResultsViewModel())
    }
}
