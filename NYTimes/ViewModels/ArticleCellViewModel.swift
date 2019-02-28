//
//  ArticleCellViewModel.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/26/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import Foundation

struct ArticleCellViewModel {
    let title: String?
    let description: String?
    let articleType: String?
    let date: String?
    let imageUrl: String?
    let thumbnailUrl: String?
    let caption: String?
    
    init(title: String, description: String, articleType: String, date: String) {
        self.title = title
        self.description = description
        self.articleType = articleType
        self.date = date
        self.thumbnailUrl = nil
        self.caption = nil
        self.imageUrl = nil
    }
    
    init(with result: Results) {
        self.title = result.title
        self.description = result.byline
        self.articleType = result.type
        self.date = result.published_date
        self.thumbnailUrl = result.media?.first?.mediametadata?.filter({ $0.format == "Standard Thumbnail" }).first?.url
        self.imageUrl = result.media?.first?.mediametadata?.filter({ $0.format == "Large" }).first?.url
        if let captionString = result.media!.first!.caption {
            self.caption = captionString
        } else {
            self.caption = nil
        }
        
    }
}
