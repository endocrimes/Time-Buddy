//
//  DataController.swift
//  Time Buddy
//
//  Created by Dan on 4/11/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import Foundation

public protocol DataControllerProtocol {
    var numberOfItems: Int { get }
    
    func insert(item: TimeZoneEntry)
    func remove(item: TimeZoneEntry)
    
    subscript(index: Int) -> TimeZoneEntry { get }
}
