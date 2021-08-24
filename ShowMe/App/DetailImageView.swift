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
    
    // MARK: - FUNCTIONS
    
    func saveImage(with urlString : String) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)
        
        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                UIImageWriteToSavedPhotosAlbum(value.image, nil, nil, nil)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
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
            
            GroupBox(label: Text("Save Image to photo library"), content: {
                Button(action: {
                    saveImage(with: item.previewURL)
                }, label: {
                    Spacer()
                    Text("Save small")
                    Spacer()
                }).modifier(ButtonModifier())
                
                Button(action: {
                    saveImage(with: item.webformatURL)
                }, label: {
                    Spacer()
                    Text("Save medium")
                    Spacer()
                }).modifier(ButtonModifier())
                
                Button(action: {
                    saveImage(with: item.largeImageURL)
                }, label: {
                    Spacer()
                    Text("Save large")
                    Spacer()
                }).modifier(ButtonModifier())
            })
        }
        .navigationBarTitleDisplayMode(.automatic)
        .padding()
    }
}

// MARK: - PREVIEW

struct FullImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageView(item: FetchItemData(pageURL: "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/", previewURL: "", webformatURL: "https://pixabay.com/get/g3a342d69ddab28859b0ae13374ad246e63d8d2bdc2d4b01f64b767d308c68c6370dd1730d3ac86d8da4cb8ab13881dd8516cad495e6aa0bcaeb67256a5083817_640.jpg", largeImageURL: ""))
    }
}
