//
//  NYTimesUITests.swift
//  NYTimesUITests
//
//  Created by Bhuvanendra Pratap Maurya on 2/26/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import XCTest

class NYTimesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["By MARK MAZZETTI, MAGGIE HABERMAN, NICHOLAS FANDOS and MICHAEL S. SCHMIDT"]/*[[".cells.staticTexts[\"By MARK MAZZETTI, MAGGIE HABERMAN, NICHOLAS FANDOS and MICHAEL S. SCHMIDT\"]",".staticTexts[\"By MARK MAZZETTI, MAGGIE HABERMAN, NICHOLAS FANDOS and MICHAEL S. SCHMIDT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["2019 Oscar Winners: The Full List"]/*[[".cells.staticTexts[\"2019 Oscar Winners: The Full List\"]",".staticTexts[\"2019 Oscar Winners: The Full List\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["By MARK MAZZETTI, MAGGIE HABERMAN, NICHOLAS FANDOS and MICHAEL S. SCHMIDT"]/*[[".cells.staticTexts[\"By MARK MAZZETTI, MAGGIE HABERMAN, NICHOLAS FANDOS and MICHAEL S. SCHMIDT\"]",".staticTexts[\"By MARK MAZZETTI, MAGGIE HABERMAN, NICHOLAS FANDOS and MICHAEL S. SCHMIDT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    }

}
