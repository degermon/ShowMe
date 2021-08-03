//
//  FetchResultsViewModel.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-28.
//

import SwiftUI
import Combine

class FetchResultsViewModel: ObservableObject {
    
    @Published var searchQuerry = "" // search text from searchBar
    @Published var imagesData: [FetchItemData]? = nil // fetched data from API
    @Published var page: Int = 1
    @Published var isLoading: Bool = false // bool for current call
    var searchCancellable: AnyCancellable? = nil     // for cancelation of search publisher
    private let API_KEY = "22590677-2336ceb55dc631d789d3e75d2"
    
    init() {
        searchCancellable = $searchQuerry
            .removeDuplicates()
            .debounce(for: 1, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                self.imagesData = nil // clear fetched data
                if str != "" {
                    self.searchForImagesWith(keywords: str)
                } else {
                    self.page = 1 // reset page when search is cleared
                }
            })
    }
    
    func searchForImagesWith(keywords: String) {
        let formattedKeywords = formatKeywords(keywords) // change all empty spaces between words with + character
        
        let urlString = "https://pixabay.com/api/?key=\(API_KEY)&q=\(formattedKeywords)&image_type=photo&orientation=horizontal&page=\(page)"
        let url = parseURL(urlString: urlString) // string to url
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let APIData = data else {
                print("No data found") // if no data is present
                return
            }
            
            do {
                let images = try JSONDecoder().decode(FetchResults.self, from: APIData)
                DispatchQueue.main.async {
                    if self.imagesData != nil {
                        self.imagesData?.append(contentsOf: images.hits)
                    } else {
                        self.imagesData = images.hits
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.isLoading = false // set laoding bool to fasle after api call ended
            }
        }
        .resume()
    }
    
    private func parseURL(urlString: String) -> URL{
        guard let url = URL(string: urlString) else { return URL(string: "")! }
        return url
    }
    
    private func formatKeywords(_ keywords: String) -> String {
        let formattedKeywordsString = keywords.replacingOccurrences(of: " ", with: "+")
        return formattedKeywordsString
    }
}
