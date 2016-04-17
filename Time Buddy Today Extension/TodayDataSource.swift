//
//  TodayDataSource.swift
//  Time Buddy
//
//  Created by Dan on 4/17/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import AppKit
import TimeBuddyKit

class TodayDataSource: NSObject, NSCollectionViewDataSource {
    private struct Statics {
        static let timeCellIdentifier = "TodayViewControllerTimeCell"
    }
    
    static func registerCellsInCollectionView(collectionView: NSCollectionView) {
        let nib = NSNib(nibNamed: "TimeZoneCollectionViewItem", bundle: nil)
        collectionView.registerNib(nib, forItemWithIdentifier: Statics.timeCellIdentifier)
    }
    
    let dataController: DataControllerProtocol
    
    init(dataController: DataControllerProtocol) {
        self.dataController = dataController
    }
    
    // MARK - NSCollectionViewDataSource
    
    func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataController.numberOfItems
    }
    
    func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
        let view = collectionView.makeItemWithIdentifier(Statics.timeCellIdentifier, forIndexPath: indexPath) as! TimeZoneCollectionViewItem
        
        let item = dataController[indexPath.item]
        let displayView = view.itemView
        displayView.locationLabel?.stringValue = item.label
        
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeZone = item.timeZone
        formatter.dateFormat = "HH:mm"
        displayView.timeLabel?.stringValue = formatter.stringFromDate(date)
        
        
        return view
    }
}