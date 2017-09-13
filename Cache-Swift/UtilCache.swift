//
//  UtilCache.swift
//  Cache-Swift
//
//  Created by issam on 12/09/2017.
//  Copyright © 2017 FSDM. All rights reserved.
//

import Foundation
let sizeCache = 128 //size of cache kb
func sizeof <T> (_ value : [T]) -> Int{
    return (MemoryLayout<T>.size * value.count)
}
func sizeof <T> (_ : T.Type) -> Int{
    return (MemoryLayout<T>.size)
}

func sizeof <T> (_ : T) -> Int{
    return (MemoryLayout<T>.size)
}
