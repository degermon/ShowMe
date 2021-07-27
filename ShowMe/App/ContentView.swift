//
//  ContentView.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @State private var searchText = ""
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(text: $searchText)
                    .padding(8)
                GridLayout(showMe: $searchText)
            } //: SCROLL
            .navigationTitle("Show Me!")
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
