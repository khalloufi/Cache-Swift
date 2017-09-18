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
        let m1 = Mobile()
        m1.location = Location(x: 1, y: 1)
        m1.velocity = Velocity(x: 1, y: 1)
        FARCache.sharedInstance.add(m1)
        
        let m2 = Mobile()
        m2.location = Location(x: 3, y: 3)
        m2.velocity = Velocity(x: -2, y: 0)
        FARCache.sharedInstance.add(m2)
        
        let m3 = Mobile()
        m3.location = Location(x: -2, y: 3)
        m3.velocity = Velocity(x: 0, y: -5)
        FARCache.sharedInstance.add(m3)
        
        let m4 = Mobile()
        m4.location = Location(x: -2, y: -2)
        m4.velocity = Velocity(x: 6, y: -3)
        FARCache.sharedInstance.add(m4)
        
        let m5 = Mobile()
        m5.location = Location(x: 2, y: -3)
        m5.velocity = Velocity(x: 3, y: 1)
        FARCache.sharedInstance.add(m5)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

