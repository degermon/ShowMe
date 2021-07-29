//
//  ImagesView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-28.
//

import SwiftUI

struct ImagesView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var fetchResults: FetchResultsViewModel
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    SearchBar(text: $fetchResults.searchQuerry)
                } //: VSTACK
                
                if let images = fetchResults.imagesData {
                    if images.isEmpty { // if fetched data is empty
                        Text("No Results Found")
                            .padding()
                    } else { // there is a fetched data
                        // displaying results
                        GridLayoutView()
                    }
                } else { // if no data is fetched yet
                    // show loading animation
                    if fetchResults.searchQuerry != "" {
                        ProgressView()
                            .padding(30)
                    }
                }
            }) //: SCROLL
            .padding(.horizontal, 8)
            .navigationTitle("Show Me!")
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView().environmentObject(FetchResultsViewModel())
    }
}
