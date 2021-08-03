//
//  GridItemView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-08-03.
//

import SwiftUI
import Kingfisher

struct GridItemView: View {
    
    // MARK: - PROPERTIES
    
    var item: FetchItemData
    
    // MARK: - BODY
    
    var body: some View {
        KFImage(URL(string: item.previewURL))
            .placeholder {
                Image("default")
                    .imageIconModifier()
            }
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .shadow(radius: 8)
            
    }
}

// MARK: - PREVIEW

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(item: FetchItemData(pageURL: "", previewURL: "https://cdn.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg", webformatURL: "")).previewLayout(.sizeThatFits)
    }
}
