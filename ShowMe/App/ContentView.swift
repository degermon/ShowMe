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
        SearchBar(text: $searchText)
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
