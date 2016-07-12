//
//  PriorityQueue.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public struct PriorityQueue<T> {
    
    private var items = [T]()
    
    public let compare: (T, T) -> Bool
    public var isEmpty: Bool {
        return items.isEmpty
    }
    
    public var count: Int {
        return items.count
    }
    
    init(compare: (T, T) -> Bool) {
        self.compare = compare
    }
    
    public mutating func enqueue(value: T) {
        items.append(value)
        heapifyOnEnqueue()
    }
    
    public mutating func dequeue() -> T? {
        if items.isEmpty {
            return nil
        }
        
        let value = items.first
        items[0] = items[items.count - 1]
        items.removeAtIndex(items.count - 1)
        heapifyOnDequeue(0)
        return value
    }
    
    public func peek() -> T? {
        return items.first
    }
    
    private mutating func heapifyOnEnqueue() {
        
        var i = items.count - 1;
        while i > 0 && compare(items[i], items[parentIndex(i)])  {
            swap(&items[i], &items[parentIndex(i)])
            i = parentIndex(i)
        }

    }
    
    private mutating func heapifyOnDequeue(i: Int) {
        
        let left = leftIndex(i)
        let right = rightIndex(i)
        var largest = i
        
        if left < items.count && compare(items[left], items[largest]) {
            largest = left
        }
        
        if right < items.count && compare(items[right], items[largest]) {
            largest = right
        }
        
        if largest != i {
            swap(&items[i], &items[largest])
            heapifyOnDequeue(largest)
        }
    }
    
    private func parentIndex(i: Int) -> Int {
        return (i - 1) >> 1
    }
    
    private func leftIndex(i: Int) -> Int {
        return (i << 1) + 1
    }
    
    private func rightIndex(i: Int) -> Int {
        return (i << 1) + 2
    }
}