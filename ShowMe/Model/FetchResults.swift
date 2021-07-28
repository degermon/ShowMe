//
//  FetchResults.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-28.
//

import Foundation

struct FetchResults: Decodable {
    let hits: [FetchItemData]
}

struct FetchItemData: Decodable, Identifiable {
    let id = UUID()
    let pageURL: String
    let previewURL: String
    let webformatURL: String
}
