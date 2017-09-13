//
//  LRUCache.swift
//  Cache-Swift
//
//  Created by issam on 12/09/2017.
//  Copyright © 2017 FSDM. All rights reserved.
//

import Cocoa

class LRUCache: NSObject {
    static let sharedInstance:LRUCache = LRUCache()
    private var cache:[String:CacheEntry] = [String:CacheEntry]()
    private var keys:[String] = [String]()
    override fileprivate init() {
        super.init()
    }
    func addEntry(_ entry:CacheEntry){
        while isFull(){
            if let key = keys.last{
                cache.removeValue(forKey: key)
            }
        }
        keys.insert(entry.uuid, at: 0)
        cache[entry.uuid] = entry
    }
    func getEntry(_ key:String) -> CacheEntry?{
        if cache.keys.contains(key){
            if let entry = cache[key]{
                if let index = keys.index(of: key){
                    keys.remove(at: index)
                    keys.insert(key, at: 0)
                }
                cache.removeValue(forKey: key)
                cache[key] = entry
                return entry
            }
        }
        return nil
    }
    func allEntries(){
        for (key,value) in cache{
            print("key : \(key) value : \(value)")
        }
    }
    func isFull() -> Bool{
        if sizeof(cache) > sizeCache{
            return true
        }
        return false
    }
}
