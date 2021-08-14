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
    @State private var showingSettingsView: Bool = false
    
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
                        VStack {
                            GridView()
                            Spacer() // only to push GridView to top if needed (if not enough images to populate/dispaly in grid view)
                        } //: VSTACK
                        .frame(minHeight: UIScreen.main.bounds.height * 0.6, maxHeight: .infinity) // min height for cases when there are only a few images to display, without it GeometryReader would be triggered constantly and requesting api for moreinages (pages) when there are no more images (constant trigger to show ProgressView)
                        
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
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingSettingsView.toggle()
                }, label: {
                    Image(systemName: "gearshape")
                        .foregroundColor(Color("ColorCustomLightPurple"))
                })
            )
        } //: NAVIGATION
//        .accentColor(Color("ColorCustomLightPurple"))
        .sheet(isPresented: $showingSettingsView) {
            SettingsView()
        } // moved out of toolbar, else dismissal of sheet will not work
    }
}

// MARK: - PREVIEW

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView().environmentObject(FetchResultsViewModel())
    }
}
