//
//  SNInterviewTests.swift
//  SNInterviewTests
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import XCTest
@testable import SNInterview

class SNInterviewTests: XCTestCase {
    
    // sut = Subject Under Test
    var sut: CoffeeShopViewModel!

    override func setUp() {
        super.setUp()
        sut = CoffeeShopViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCoffeeShop() {
        let coffeeShop = CoffeeShop(name: "Test Coffee", review: "Test Review", rating: 1)
        XCTAssertEqual(coffeeShop.name, "Test Coffee")
        XCTAssertEqual(coffeeShop.review, "Test Review")
        XCTAssertEqual(coffeeShop.rating, 1)
    }
    
    func testLoadFromJSON() {
        let coffeeJSONData = sut.getData()
        
        // Test if the data coming from JSON is not nil
        for coffeeData in coffeeJSONData {
            XCTAssertNotNil(coffeeData.name)
            XCTAssertNotNil(coffeeData.rating)
            XCTAssertNotNil(coffeeData.review)
        }
        
        // Test the count of JSON, in this case 5
        XCTAssertEqual(coffeeJSONData.count, 5)
    }
}
