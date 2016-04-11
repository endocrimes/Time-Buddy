//
//  TimeZoneEntry.swift
//  Time Buddy
//
//  Created by Dan on 4/11/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import Foundation

public protocol TimeZoneEntry {
    var label: String { get }
    var timezoneName: String { get }
    
    func isEqual(entry: TimeZoneEntry) -> Bool
}

public func ==(lhs: TimeZoneEntry, rhs: TimeZoneEntry) -> Bool {
    return lhs.isEqual(rhs)
}

public extension TimeZoneEntry {
    public var timeZone: NSTimeZone? {
        return NSTimeZone(name: timezoneName)
    }
    
    public func isEqual(entry: TimeZoneEntry) -> Bool {
        return self.label == entry.label && self.timezoneName == entry.timezoneName
    }
}

public struct LightweightTimeZone: TimeZoneEntry, Equatable {
    public var label: String
    public var timezoneName: String
    
    public init(label: String, tzName: String) {
        self.label = label
        self.timezoneName = tzName
  }
}

public func ==(lhs: LightweightTimeZone, rhs: LightweightTimeZone) -> Bool {
    return lhs.isEqual(rhs)
}
