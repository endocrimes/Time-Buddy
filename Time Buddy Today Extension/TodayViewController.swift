//
//  TodayViewController.swift
//  Time Buddy Today Extension
//
//  Created by Dan on 4/13/16.
//  Copyright © 2016 Rocket Apps. All rights reserved.
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController, NCWidgetProviding, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
    private struct Statics {
        static let timeCellIdentifier = "TodayViewControllerTimeCell"
    }
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override var nibName: String? {
        return "TodayViewController"
    }
    
    let numberOfColumns = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = NSNib(nibNamed: "TimeZoneCollectionViewItem", bundle: nil)
        print(nib)
        collectionView.registerNib(nib, forItemWithIdentifier: Statics.timeCellIdentifier)
        
        if let flowLayout = collectionView.collectionViewLayout as? NSCollectionViewFlowLayout {
            let minimumSpacing: CGFloat = 5.0
            flowLayout.minimumInteritemSpacing = minimumSpacing
            flowLayout.minimumLineSpacing = minimumSpacing
            flowLayout.sectionInset = NSEdgeInsetsMake(minimumSpacing, minimumSpacing,
                                                       minimumSpacing, minimumSpacing)
            
            let screenWidth: CGFloat = 280
            let itemWidth: CGFloat = floor((screenWidth - (minimumSpacing * (CGFloat(numberOfColumns) + 1.0))) / CGFloat(numberOfColumns))

            flowLayout.itemSize = CGSizeMake(58, itemWidth);
        }
        
        collectionView.reloadData()
        
        collectionView.backgroundView = nil
        collectionView.backgroundColors = [NSColor.clearColor()]
        
        recalculateHeight()
    }
    
    func recalculateHeight() {
        let itemCount = collectionView.numberOfItemsInSection(0)
        let numberOfRows = Int(ceil(Double(itemCount) / Double(numberOfColumns)))
        let rowHeight = 68
        preferredContentSize = NSSize(width: 280, height: rowHeight * numberOfRows)
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        completionHandler(.NewData)
    }
    
    //MARK: - NSCollectionViewDataSource
    
    func collectionView(collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: NSCollectionView, itemForRepresentedObjectAtIndexPath indexPath: NSIndexPath) -> NSCollectionViewItem {
        let view = collectionView.makeItemWithIdentifier(Statics.timeCellIdentifier, forIndexPath: indexPath)
        print(view)
        return view
    }
}
