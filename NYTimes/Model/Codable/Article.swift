//
//  Article.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/26/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let status: String?
    let results: [Results]?
}

struct Results: Decodable {
    let title: String?
    let byline: String?
    let type: String?
    let published_date: String?
    let media: [Media]?
}

struct Media {
    let caption: String?
    let mediametadata: [MediaMetadata]?
}

extension Media: Decodable {
    enum CodingKeys: String, CodingKey {
        case caption
        case mediametadata = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        caption = try container.decodeIfPresent(String.self, forKey: .caption)
        mediametadata = try container.decode([MediaMetadata].self, forKey: .mediametadata)
    }
    
}

struct MediaMetadata: Decodable {
    let url: String?
    let format: String?
}
