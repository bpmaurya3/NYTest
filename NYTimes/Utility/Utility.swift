//
//  Utility.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/27/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import Foundation

struct Utility {
    static func getDateString(dateString: String, format: String = "MMM d, yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = format
            let dateString = dateFormatter.string(from: date) as String
            
            return dateString
        }
        
        return ""
    }
}
