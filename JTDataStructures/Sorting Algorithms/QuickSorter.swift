//
//  QuickSorter.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/15/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

struct QuickSorter<T: Comparable> {
    
    static func sort(_ array: inout [T], low: Int, high: Int) {
        if low < high {
            let p = partition(&array, low: low, high: high)
            sort(&array, low: low, high: p)
            sort(&array, low: p + 1, high: high)
        }
    }
    
    // Hoare's Partition
    private static func partition(_ array: inout [T], low: Int, high: Int) -> Int {
        let pivot = array[Int(arc4random()) % array.count]
        var i = low - 1
        var j = high + 1
        
        while (true) {
            repeat {
                i += 1
            } while array[i] < pivot
            
            repeat {
                j -= 1
            } while array[j] > pivot
            
            if i < j {
                array.swapAt(i, j)
            } else {
                return j
            }
        }
    }
}
