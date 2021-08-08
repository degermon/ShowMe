//
//  GridItemView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-08-03.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
    
    // MARK: - PROPERTIES
    
    var urlStringForImageDisplay: String
    
    // MARK: - BODY
    
    var body: some View {
        KFImage(URL(string: urlStringForImageDisplay))
            .placeholder {
                Image("default")
                    .imageIconModifier()
            }
            .resizable()
            .scaledToFit()
            .shadow(radius: 8)
    }
}

// MARK: - PREVIEW

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlStringForImageDisplay: "https://cdn.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg").previewLayout(.sizeThatFits)
    }
}
