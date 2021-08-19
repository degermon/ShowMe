//
//  FullImageView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-08-08.
//

import SwiftUI
import Kingfisher

struct DetailImageView: View {
    
    // MARK: - PROPERTIES
    
    var item: FetchItemData
    
    // MARK: - BODY
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ImageView(urlStringForImageDisplay: item.webformatURL)
            
            GroupBox() {
                HStack {
                    Text("Image original source")
                    Spacer()
                    Link("Pixabay", destination: URL(string: item.pageURL)!)
                    Image(systemName: "arrow.up.right.square")
                }
                .font(.footnote)
            }
        }
        .navigationBarTitleDisplayMode(.automatic)
        .padding()
    }
}

// MARK: - PREVIEW

struct FullImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageView(item: FetchItemData(pageURL: "", previewURL: "", webformatURL: "https://pixabay.com/get/g7e987b88da258d76ea0d6e562d19269191a25e0e3a1e59c76a2b705ccef35013c82a10d935adcf4eff1f2b122c7575a49c037d451634fb950b3b7aaa80a642d4_640.jpg"))
    }
}
