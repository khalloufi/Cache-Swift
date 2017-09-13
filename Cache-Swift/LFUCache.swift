//
//  LFUCache.swift
//  Cache-Swift
//
//  Created by issam on 12/09/2017.
//  Copyright © 2017 FSDM. All rights reserved.
//

import Cocoa

class LFUCache: NSObject {
    static let sharedInstance:LFUCache = LFUCache()
    private var cache:[String:CacheEntry] = [String:CacheEntry]()
    override fileprivate init() {
        super.init()
    }
    func addEntry(_ entry:CacheEntry){
        while isFull(){
            if let entryKeyToBeRemoved = getLFUKey(){
                cache.removeValue(forKey: entryKeyToBeRemoved)
            }
        }
        cache[entry.uuid] = entry
    }
    func getLFUKey() -> String?{
        var _key:String?
        var _minFreq = Int.max
        
        for (key,entry) in cache{
            if _minFreq > entry.frequency{
                _key = key
                _minFreq = entry.frequency
            }
        }
        return _key;
    }
    func getEntry(_ key:String) -> CacheEntry?{
        if cache.keys.contains(key){
            if let entry = cache[key]{
                entry.frequency += 1
                cache[key] = entry
                return entry
            }
        }
        return nil
    }
    func isFull() -> Bool{
        if sizeof(cache) > sizeCache{
            return true
        }
        return false
    }
}
