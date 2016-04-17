//
//  TimeZoneCollectionViewItem.swift
//  Time Buddy
//
//  Created by Dan on 4/13/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import Cocoa

class TimeZoneCollectionViewItem: NSCollectionViewItem {
    var itemView: TimeZoneCollectionViewItemView {
        return view as! TimeZoneCollectionViewItemView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = itemView.timeBackgroundView!.layer!
        layer.cornerRadius = 6
        layer.backgroundColor = NSColor(calibratedRed: 0.41,
                                        green: 0.27,
                                        blue: 0.85,
                                        alpha: 1.00).CGColor
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
}
