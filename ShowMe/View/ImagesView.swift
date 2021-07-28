//
//  ImagesView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-28.
//

import SwiftUI

struct ImagesView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var fetchResultsData: FetchResultsViewModel
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    SearchBar(text: $fetchResultsData.searchQuerry)
                } //: VSTACK
                
                if let images = fetchResultsData.fetchedImagesData {
                    if images.isEmpty { // if fetched data is empty
                        Text("No Results Found")
                            .padding()
                    } else { // there is a fetched data
                        // displaying results
                        GridLayoutView()
                    }
                } else { // if no data is fetched
                    // loading screen
                    if fetchResultsData.searchQuerry != "" {
                        ProgressView()
                            .padding()
                    }
                }
            }) //: SCROLL
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
