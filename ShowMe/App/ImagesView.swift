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
                
                SearchBar(text: $fetchResults.searchQuerry)
                
                if let images = fetchResults.imagesData {
                    if images.isEmpty { // if data is empty
                        Text("No Results Found")
                            .padding()
                    } else { // there is a fetched data
                        // displaying results
                        GridView()
                        
                        if fetchResults.isLoading {
                            ProgressView()
                                .onAppear(perform: {
                                    fetchResults.page += 1
                                    fetchResults.searchForImagesWith(keywords: fetchResults.searchQuerry) // while progressView is shown, fetch new page of images with same search keyword
                                })
                        } else {
                            GeometryReader { reader ->  Color in
                                
                                let minY = reader.frame(in: .global).minY
                                let height = UIScreen.main.bounds.height / 1.5
                                
                                if minY < height {
                                    DispatchQueue.main.async {
                                        fetchResults.isLoading = true
                                    }
                                }
                                return Color.clear
                            } // GEOMETRY READER
                            .frame(width: 20, height: 20)
                        }
                    } // displaying fetched data
                } else { // if no data is fetched yet
                    // show loading animation
                    if fetchResults.searchQuerry != "" {
                        ProgressView()
                            .padding(30)
                    } // show if searchField is not empty
                }
                
                if fetchResults.imagesData?.isEmpty != true && fetchResults.imagesData != nil { // show only is some data/images is fetched from api
                    ClearButton()
                        .padding(.bottom, 10)
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
