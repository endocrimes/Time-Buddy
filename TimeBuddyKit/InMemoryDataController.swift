//
//  InMemoryDataController.swift
//  Time Buddy
//
//  Created by Dan on 4/11/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import Foundation

public class InMemoryDataController: DataControllerProtocol {
    public var data = [TimeZoneEntry]()
    
    public var numberOfItems: Int { return data.count }
    
    public func insert(item: TimeZoneEntry) {
        data.append(item)
        data.sortInPlace({ return $0.0.timeZone!.secondsFromGMT < $0.1.timeZone!.secondsFromGMT })
    }
    
    public func remove(item: TimeZoneEntry) {
        while let index = data.indexOf({ $0 == item }) {
            data.removeAtIndex(index)
        }
    }
    
    public subscript(index: Int) -> TimeZoneEntry {
        return data[index]
    }
    
    public init() {
    }
}
