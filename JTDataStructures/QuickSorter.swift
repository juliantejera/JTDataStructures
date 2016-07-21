//
//  QuickSorter.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/15/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public struct QuickSorter<T: Comparable> {
    
    public func sort(inout array: [T], low: Int, high: Int) {
        if low < high {
            let p = partition(&array, low: low, high: high)
            sort(&array, low: low, high: p)
            sort(&array, low: p + 1, high: high)
        }
    }
    
    // Hoare's Partition
    private func partition(inout array: [T], low: Int, high: Int) -> Int {
        
        let pivot = array[random() % array.count]
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
                swap(&array[i], &array[j])
            } else {
                return j
            }
        }
    }
    
    

}