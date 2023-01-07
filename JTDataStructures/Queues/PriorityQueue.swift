//
//  PriorityQueue.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

struct PriorityQueue<T> {
    
    private var items = [T]()
    let compare: (T, T) -> Bool
    var isEmpty: Bool {
        items.isEmpty
    }
    
    var count: Int {
        items.count
    }
    
    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    // O(log n)
    mutating func enqueue(_ value: T) {
        items.append(value)
        heapifyOnEnqueue()
    }
    
    // O(log n)
    mutating func dequeue() -> T? {
        if items.isEmpty {
            return nil
        }
        
        let value = items.first
        items[0] = items[items.count - 1]
        items.remove(at: items.count - 1)
        heapifyOnDequeue(index: 0)
        return value
    }
    
    // O(1)
    func peek() -> T? {
        items.first
    }
    
    private mutating func heapifyOnEnqueue() {
        var i = items.count - 1;
        while i > 0 && compare(items[i], items[parent(index: i)])  {
            items.swapAt(i, parent(index: i))
            i = parent(index: i)
        }
    }
    
    private mutating func heapifyOnDequeue(index: Int) {
        let leftIndex = left(index: index)
        let rightIndex = right(index: index)
        var largestIndex = index
        
        if leftIndex < items.count && compare(items[leftIndex], items[largestIndex]) {
            largestIndex = leftIndex
        }
        
        if rightIndex < items.count && compare(items[rightIndex], items[largestIndex]) {
            largestIndex = rightIndex
        }
        
        if largestIndex != index {
            items.swapAt(index, largestIndex)
            heapifyOnDequeue(index: largestIndex)
        }
    }
    
    // (index - 1) / 2
    private func parent(index: Int) -> Int {
        (index - 1) >> 1
    }
    
    // (index * 2) + 1
    private func left(index: Int) -> Int {
        (index << 1) + 1
    }
    
    // (index * 2) + 2
    private func right(index: Int) -> Int {
        (index << 1) + 2
    }
}
