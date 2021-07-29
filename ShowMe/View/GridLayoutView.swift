//
//  GridLayoutView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-27.
//

import SwiftUI
import Kingfisher

struct GridLayoutView: View {
    
    // MARK: - PROPERTIES
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200), spacing: 8), count: 3)
    @EnvironmentObject var fetchResultsData: FetchResultsViewModel
    
    // MARK: - BODY
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 8, content: {
            ForEach(fetchResultsData.imagesData ?? []) { item in
                    KFImage(URL(string: item.previewURL))
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                
            }
            .padding(8)
        }) //: GRID
    }
}

// MARK: - PREVIEW

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayoutView().environmentObject(FetchResultsViewModel())
    }
}
