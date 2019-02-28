//
//  NetworkManagerTest.swift
//  NYTimesTests
//
//  Created by Bhuvanendra Pratap Maurya on 2/27/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import Foundation
import XCTest

@testable import NYTimes

class NetworkManagerTests: XCTestCase {
    
    func testFetchMostPopularAPI() {
        let exp = expectation(description: "Articles Retreived")
        let timeOut = 60.0
        NetworkManager().fetchMostPopularArticles(sectionNo: "7") { (results, error) in
            if error != nil {
                XCTFail()
            } else {
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: timeOut) { (error) in
            XCTAssertNil(error)
        }
    }
    
    
}
