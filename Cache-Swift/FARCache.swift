//
//  FARCache.swift
//  Cache-Swift
//
//  Created by issam on 12/09/2017.
//  Copyright © 2017 FSDM. All rights reserved.
//

import Cocoa

class FARCache: NSObject {
    var C = [Any]() //Cache
    
    //Manhatan distance
    func distance(_ seg:CGRect, location:CGPoint) -> CGFloat{
        return (seg.origin.x - location.x) * (seg.origin.x - location.x) + (seg.origin.y - location.y) * (seg.origin.y - location.y)
    }
    func FAR() -> Bool{
        var inDirection:[Any]?
        var outDirection:[Any]?
        var epsilon = 0
        var Mf:CGPoint?
        for seg in C{
            if distance(CGRect.zero, location: CGPoint.zero) > 0{
                if inDirection == nil{
                    inDirection = [Any]()
                }
                inDirection?.append(seg)
            }else{
                if outDirection == nil{
                    outDirection = [Any]()
                }
                outDirection?.append(seg)
            }
        }
        while outDirection != nil && outDirection!.isEmpty == false{
            if sizeof(C) < sizeCache{
                return true
            }
        }
        while inDirection != nil && inDirection!.isEmpty == false{
            if sizeof(C) < sizeCache{
                return true
            }
        }
        return false
    }
}
