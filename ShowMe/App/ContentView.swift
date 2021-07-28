//
//  ContentView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @StateObject var fetchResultsData = FetchResultsViewModel()

    // MARK: - BODY
    
    var body: some View {
        ImagesView()
            .environmentObject(fetchResultsData)
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
