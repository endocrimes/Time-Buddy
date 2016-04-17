//
//  TodayViewController.swift
//  Time Buddy Today Extension
//
//  Created by Dan on 4/13/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import Cocoa
import NotificationCenter
import TimeBuddyKit

class TodayViewController: NSViewController, NCWidgetProviding {
    @IBOutlet weak var collectionView: NSCollectionView!
    var todayDataSource: TodayDataSource!
    
    override var nibName: String? {
        return "TodayViewController"
    }
    
    let numberOfColumns = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TodayDataSource.registerCellsInCollectionView(collectionView)
        
        let dataController = InMemoryDataController()
        dataController.insert(LightweightTimeZone(label: "LDN", tzName: "Europe/London"))
        dataController.insert(LightweightTimeZone(label: "NYC", tzName: "America/New_York"))
        dataController.insert(LightweightTimeZone(label: "SFO", tzName: "America/Los_Angeles"))
        dataController.insert(LightweightTimeZone(label: "MDE", tzName: "America/Bogota"))
        dataController.insert(LightweightTimeZone(label: "BER", tzName: "Europe/Berlin"))
        todayDataSource = TodayDataSource(dataController: dataController)
        
        let layout = ColumnBasedFlowLayout(numberOfColumns: numberOfColumns,
                                           minimumPadding: 8.0,
                                           totalWidth: 280,
                                           itemHeight: 50)
        collectionView.collectionViewLayout = layout
        
        collectionView.backgroundView = nil
        collectionView.backgroundColors = [NSColor.clearColor()]
        
        collectionView.dataSource = todayDataSource
        collectionView.reloadData()
        
        recalculateHeight()
    }
    
    func recalculateHeight() {
        let itemCount = collectionView.numberOfItemsInSection(0)
        let numberOfRows = Int(ceil(Double(itemCount) / Double(numberOfColumns)))
        let rowHeight = numberOfRows > 1 ? 58 : 50
        preferredContentSize = NSSize(width: 280, height: rowHeight * numberOfRows)
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        completionHandler(.NewData)
    }
}
