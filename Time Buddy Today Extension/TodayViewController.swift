//
//  TodayViewController.swift
//  Time Buddy Today Extension
//
//  Created by Dan on 4/13/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController, NCWidgetProviding, NSCollectionViewDataSource {
    private struct Statics {
        static let timeCellIdentifier = "TodayViewControllerTimeCell"
    }
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override var nibName: String? {
        return "TodayViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = NSNib(nibNamed: "TimeZoneCollectionViewItem", bundle: nil)
        print(nib)
        collectionView.registerNib(nib, forItemWithIdentifier: Statics.timeCellIdentifier)
        
        collectionView.reloadData()
        collectionView.backgroundView = nil
        collectionView.backgroundColors = [NSColor.clearColor()]
        
        preferredContentSize = NSSize(width: 318, height: 58)
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        completionHandler(.NewData)
    }
    
    //MARK: - NSCollectionViewDataSource
    
    func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
        let view = collectionView.makeItemWithIdentifier(Statics.timeCellIdentifier, forIndexPath: indexPath)
        print(view)
        return view
    }
}
