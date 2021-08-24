//
//  ClearButton.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-08-04.
//

import SwiftUI

struct ClearButton: View {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject var fetchResultsData: FetchResultsViewModel
    
    // MARK: - BODY
    
    var body: some View {
        Button(action: {
            fetchResultsData.imagesData = nil
            
            fetchResultsData.page += 1
            fetchResultsData.searchForImagesWith(keywords: fetchResultsData.searchQuerry) // load new page of images after clearing the old ones
        }, label: {
            Spacer()
            Text("Clear")
            Spacer()
        })
        .modifier(ButtonModifier())
        .padding()
        .font(.title2)
    }
}

// MARK: - PREVIEW

struct ClearButton_Previews: PreviewProvider {
    static var previews: some View {
        ClearButton().previewLayout(.sizeThatFits)
    }
}
