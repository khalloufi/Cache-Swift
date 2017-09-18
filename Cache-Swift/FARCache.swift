//
//  FARCache.swift
//  Cache-Swift
//
//  Created by issam on 12/09/2017.
//  Copyright © 2017 FSDM. All rights reserved.
//

import Cocoa
class Mobile:NSObject{
    var T = Date()
    var location:Location!
    var velocity:Velocity!
}
class Velocity:NSObject{
    var x = 0
    var y = 0
    init( x:Int, y:Int) {
        super.init()
        self.x = x
        self.y = y
    }
}
class Location:NSObject{
    var x = 0
    var y = 0
    convenience init( x:Int, y:Int) {
        self.init()
        self.x = x
        self.y = y
    }
    override var description: String {
        return "(\(x),\(y))"
    }
}
class Segement:NSObject{
    var T = Date()
    var location:Location!
    override var description: String {
        return "Location : \(location!)"
    }
}
class FARCache: NSObject {
    static let sharedInstance:FARCache = FARCache()
    var C = [Segement]() //Cache
    override fileprivate init() {
        super.init()
    }
    //Manhatan distance
    func distance(_ seg:Location, location:Location) -> Int{
        let x = (seg.x - location.x)
        let y = (seg.y - location.y)
        return ( x * x) + ( y * y )
    }
    func add(_ user:Mobile){
        let seg = Segement()
        seg.location = user.location
        C.append(seg)
        if C.count > 4{
            let result = FAR(user)
            if result == false{
                C = [Segement]()
            }
        }
    }
    func FAR(_ M:Mobile) -> Bool{
        var inDirection:[Segement]?
        var outDirection:[Segement]?
        let timeStamp = 1
        let futureLocation:Location = Location()
        futureLocation.x = M.location.x + (M.velocity.x * timeStamp)
        futureLocation.y = M.location.y + (M.velocity.y * timeStamp)
        for seg:Segement in C{
            if distance(seg.location, location: futureLocation) <= distance(seg.location, location: M.location){
                if inDirection == nil{
                    inDirection = [Segement]()
                }
                inDirection?.append(seg)
            }else{
                if outDirection == nil{
                    outDirection = [Segement]()
                }
                outDirection?.append(seg)
            }
        }
        while outDirection != nil && outDirection!.isEmpty == false{
            var segment = outDirection?.first
            var maxDistance = distance(segment!.location, location: M.location)
            var indexOutDirection = 0
            for (index, tmp) in outDirection!.enumerated(){
                let dis = self.distance(tmp.location, location: M.location)
                if dis > maxDistance{
                    maxDistance = dis
                    segment = tmp
                    indexOutDirection = index
                }
            }
            for (index,seg) in C.enumerated(){
                if segment?.T == seg.T{
                    C.remove(at: index)
                }
            }
            outDirection?.remove(at: indexOutDirection)
            if C.count < 4{
                return true
            }
        }
        while inDirection != nil && inDirection!.isEmpty == false{
            var segment = outDirection?.first
            var maxDistance = distance(segment!.location, location: M.location)
            var indexInDirection = 0
            for (index, tmp) in inDirection!.enumerated(){
                let dis = self.distance(tmp.location, location: M.location)
                if dis > maxDistance{
                    maxDistance = dis
                    segment = tmp
                    indexInDirection = index
                }
            }
            for (index,seg) in C.enumerated(){
                if segment?.T == seg.T{
                    C.remove(at: index)
                }
            }
            inDirection?.remove(at: indexInDirection)
            
            if C.count < 4{
                return true
            }
        }
        return false
    }
}
