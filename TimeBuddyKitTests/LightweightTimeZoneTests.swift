//
//  LightweightTimeZoneTests.swift
//  Time Buddy
//
//  Created by Dan on 4/13/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import XCTest
@testable import TimeBuddyKit

class LightweightTimeZoneTests: XCTestCase {
    var sut: LightweightTimeZone!

    override func setUp() {
        super.setUp()
        sut = LightweightTimeZone(label: "London", tzName: "Europe/London")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_value_equality() {
        XCTAssertEqual(sut, LightweightTimeZone(label: "London", tzName: "Europe/London"))
    }
    
    func test_value_inequality() {
        XCTAssertNotEqual(sut, LightweightTimeZone(label: "New York", tzName: "America/New_York"))
    }
}
