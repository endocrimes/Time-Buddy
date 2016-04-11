//
//  InMemoryDataControllerTests.swift
//  Time Buddy
//
//  Created by Dan on 4/11/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import XCTest
@testable import TimeBuddyKit

class InMemoryDataControllerTests: XCTestCase {
    var sut: InMemoryDataController!
    
    override func setUp() {
        super.setUp()
        sut = InMemoryDataController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_new_controller_has_no_items() {
        XCTAssertEqual(sut.numberOfItems, 0)
    }
    
    func test_can_insert_items() {
        let tz = LightweightTimeZone(label: "London", tzName: "Europe/London")
        sut.insert(tz)
        XCTAssertEqual(sut.numberOfItems, 1)
    }
    
    func test_can_access_items() {
        let tz = LightweightTimeZone(label: "London", tzName: "Europe/London")
        sut.insert(tz)
        let retreived = sut[0]
        XCTAssertTrue(retreived == tz as TimeZoneEntry)
    }
    
    func test_can_remove_items() {
        let tz = LightweightTimeZone(label: "London", tzName: "Europe/London")
        sut.insert(tz)
        sut.remove(tz)
        XCTAssertEqual(sut.numberOfItems, 0)
    }
}
