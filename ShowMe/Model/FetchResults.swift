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
    let id = UUID() // id value also exists in data from api, thus it mus be immutable to not be overwritten
    let pageURL: String
    let previewURL: String
    let webformatURL: String
    let largeImageURL: String
}
