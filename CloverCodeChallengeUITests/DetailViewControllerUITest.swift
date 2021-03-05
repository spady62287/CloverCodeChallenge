//
//  DetailViewControllerUITest.swift
//  CloverCodeChallengeUITests
//
//  Created by Daniel Spady on 2021-03-05.
//

import XCTest

class DetailViewControllerUITest: XCTestCase {

    // Given
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launchArguments = ["enable-testing"]
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIDLabelHasCorrectField() {
        // When
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Restaurant 1"]/*[[".cells.staticTexts[\"Restaurant 1\"]",".staticTexts[\"Restaurant 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Then
        XCTAssertEqual(app.staticTexts["idLabel"].label, "1")
    }
    
    func testNameLabelHasCorrectField() {
        // When
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Restaurant 1"]/*[[".cells.staticTexts[\"Restaurant 1\"]",".staticTexts[\"Restaurant 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Then
        XCTAssertEqual(app.staticTexts["nameLabel"].label, "Restaurant 1")
    }
    
    func testCategoryLabelHasCorrectField() {
        // When
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Restaurant 1"]/*[[".cells.staticTexts[\"Restaurant 1\"]",".staticTexts[\"Restaurant 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Then
        XCTAssertEqual(app.staticTexts["categoryLabel"].label, "fast food")
    }
    
    func testDescriptionLabelHasCorrectField() {
        // When
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Restaurant 1"]/*[[".cells.staticTexts[\"Restaurant 1\"]",".staticTexts[\"Restaurant 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Then
        XCTAssertEqual(app.staticTexts["descriptionLabel"].label, "This is the test description for restaurant 1")
    }
}
