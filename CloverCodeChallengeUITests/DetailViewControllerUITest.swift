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
        // Given
        let tables = app.tables
        let field = "Restaurant 1"
        let access = "idLabel"
        let value = "1"
        
        // When
        tables.staticTexts[field].tap()
        
        // Then
        XCTAssertEqual(app.staticTexts[access].label, value)
    }
    
    func testNameLabelHasCorrectField() {
        // Given
        let tables = app.tables
        let field = "Restaurant 1"
        let access = "nameLabel"
        let value = "Restaurant 1"

        // When
        tables.staticTexts[field].tap()

        // Then
        XCTAssertEqual(app.staticTexts[access].label, value)
    }
    
    func testCategoryLabelHasCorrectField() {
        // Given
        let tables = app.tables
        let field = "Restaurant 1"
        let access = "categoryLabel"
        let value = "fast food"

        // When
        tables.staticTexts[field].tap()
        
        // Then
        XCTAssertEqual(app.staticTexts[access].label, value)
    }
    
    func testDescriptionLabelHasCorrectField() {
        // Given
        let tables = app.tables
        let field = "Restaurant 1"
        let access = "descriptionLabel"
        let value = "This is the test description for restaurant 1"

        // When
        tables.staticTexts[field].tap()
        
        // Then
        XCTAssertEqual(app.staticTexts[access].label, value)
    }
}
