//
//  ResturauntNetworkTests.swift
//  CloverCodeChallengeTests
//
//  Created by Daniel Spady on 2021-03-03.
//

import XCTest
@testable import CloverCodeChallenge

class ResturauntNetworkTests: XCTestCase {
        
    func testResponseIsNotNil() {
        // Given
        var restaurantList: [RestaurantResult]?
        let resturantRequest = RestaurantRequest()
        let expectation = XCTestExpectation(description: "The Response Result should not be nil")
                
        // When
        RestaurantUtillity.restaurantList(resturantRequest) { response in
            restaurantList = response.result
            XCTAssertNotNil(restaurantList)
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 5)
    }
    
    func testThereAre5Resturaunts() {
        // Given
        var restaurantList: [RestaurantResult]?
        let resturantRequest = RestaurantRequest()
        let expectation = XCTestExpectation(description: "There should be 5 resturaunts in the List")
        
        // When
        RestaurantUtillity.restaurantList(resturantRequest) { response in
            restaurantList = response.result
            XCTAssertEqual(restaurantList?.count, 5)
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 5)
    }
    
    func testTheNameDataInTheResturauntList() {
        // Given
        var restaurantList: [RestaurantResult]?
        let resturantRequest = RestaurantRequest()
        let expectation = XCTestExpectation(description: "The First Model should be Resturaunt 1")
        
        // When
        RestaurantUtillity.restaurantList(resturantRequest) { response in
            restaurantList = response.result
            XCTAssertEqual(restaurantList?[0].name, "Restaurant 1")
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 5)
    }
    
    func testTheIDDataInTheResturauntList() {
        // Given
        var restaurantList: [RestaurantResult]?
        let resturantRequest = RestaurantRequest()
        let expectation = XCTestExpectation(description: "The Third Model ID should be ID 3")
        
        // When
        RestaurantUtillity.restaurantList(resturantRequest) { response in
            restaurantList = response.result
            XCTAssertEqual(restaurantList?[2].identifier, 3)
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 5)
    }
    
    func testErrorNetworkCall() {
        // Given
        let expectation = XCTestExpectation(description: "Test Request Can Handle Errors")
        class MockRequest: BaseRequest {
            override var url: URL? {
                let urlString = "https://wwww.badlink.error"
                return URL(string: urlString)
            }
        }
        let errorRequest = MockRequest()
        
        // When
        RestaurantUtillity.restaurantList(errorRequest) { response in
            if let error = response.error {
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 5)
    }
}
