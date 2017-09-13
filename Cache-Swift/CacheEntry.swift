//
//  CacheEntry.swift
//  Cache-Swift
//
//  Created by issam on 12/09/2017.
//  Copyright © 2017 FSDM. All rights reserved.
//

import Cocoa

class CacheEntry: NSObject {
    var uuid:String!
    var frequency:Int = 0
    var data:Any!
    override init() {
        super.init()
        self.uuid = UUID().uuidString
    }
    override var description: String {
      return "frequency : \(frequency) date : \(data)"
    }
}
