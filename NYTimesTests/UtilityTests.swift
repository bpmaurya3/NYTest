//
//  UtilityTests.swift
//  NYTimesTests
//
//  Created by Bhuvanendra Pratap Maurya on 2/27/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import Foundation
import XCTest
@testable import NYTimes

class UtilityTests: XCTestCase {
    
    func testGetDateString() {
        
        let givenDateString = "2014-12-23"
        
        let convertedDateString = Utility.getDateString(dateString: givenDateString)
        if convertedDateString == "" {
            XCTFail()
        }
    }
    
}
