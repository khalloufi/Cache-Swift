//
//  ViewController.swift
//  Cache-Swift
//
//  Created by issam on 12/09/2017.
//  Copyright © 2017 FSDM. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let entry1 = CacheEntry()
        LRUCache.sharedInstance.addEntry(entry1)
        
        let entry2 = CacheEntry()
        LRUCache.sharedInstance.addEntry(entry2)
        
        let _ = LRUCache.sharedInstance.getEntry(entry1.uuid)
        
        let entry3 = CacheEntry()
        LRUCache.sharedInstance.addEntry(entry3)
        
        let _ = LRUCache.sharedInstance.getEntry(entry2.uuid)

        let entry4 = CacheEntry()
        LRUCache.sharedInstance.addEntry(entry4)

        let entry5 = CacheEntry()
        LRUCache.sharedInstance.addEntry(entry5)
        
        LRUCache.sharedInstance.allEntries()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

