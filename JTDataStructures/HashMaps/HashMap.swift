//
//  HashMap.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 10/26/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

struct KeyValueWrapper<Key: Hashable, Value> {
    let key: Key
    var value: Value
}

struct HashMap<Key: Hashable, Value> {
    
    typealias KeyValue = KeyValueWrapper<Key, Value>
    // Knuth suggests this constant, so it must be good! 🤔
    // The only requirement is the constant should be between 0 and 1
    let multiplicationMethodConstant: Double = (sqrt(5) - 1) / 2.0
    
    private var capacity: Int
    private(set) var count = 0
    var buckets: [[KeyValue]?]
    
    init(capacity: Int = 20) {
        self.capacity = capacity
        self.buckets = Array(repeating: nil, count: capacity)
    }
    
    // Uses multiplication method to create hash
    // h(k) = floor( m * (k * A mod 1) )
    // m = capacity of HashMap
    // k = hash value of the key
    // A = constant between 0 and 1
    private func hash(forKey key: Key) -> Int {
        let product: Double = multiplicationMethodConstant * Double(key.hashValue)
        return Int(Double(capacity) * (product - floor(product)))
    }
    
    subscript(key: Key) -> Value? {
        get {
            return search(key: key)
        }
        set(value) {
            upsert(key: key, value: value)
        }
    }
    
    private mutating func bucket(forHash h: Int) -> [KeyValue] {
        guard let bucket = buckets[h] else {
            let bucket = [KeyValue]()
            buckets[h] = bucket
            return bucket
        }
        
        return bucket
    }
    
    private func search(key: Key) -> Value? {
        let h = hash(forKey: key)
        guard let bucket = buckets[h] else {
            return nil
        }
        
        for element in bucket {
            if element.key == key {
                return element.value
            }
        }
        
        return nil
    }
    
    private mutating func upsert(key: Key, value: Value?) {
        guard let value else {
            // If we're trying to set the value to nil
            remove(key: key)
            return
        }
        
        let h = hash(forKey: key)
        let bucket = bucket(forHash: h)
        
        // Update element if it exists
        if let index = index(of: key, in: bucket) {
            buckets[h]?[index].value = value
        } else {
            buckets[h]?.append(KeyValue(key: key, value: value))
            count += 1
            resizeIfNeeded()
        }
    }
    
    func contains(key: Key) -> Bool {
        let h = hash(forKey: key)
        guard let bucket = buckets[h] else {
            return false
        }
        
        for element in bucket {
            if element.key == key {
                return true
            }
        }
        
        return false
    }
    
    private func index(of key: Key, in bucket: [KeyValue]) -> Int? {
        for (index, element) in bucket.enumerated() {
            if element.key == key {
                return index
            }
        }
        
        return nil
    }
    
    mutating func remove(key: Key) {
        let h = hash(forKey: key)
        
        guard let bucket = buckets[h], let indexOfElementToBeRemoved = index(of: key, in: bucket) else {
            return
        }
        
        buckets[h]?.remove(at: indexOfElementToBeRemoved)
        count -= 1
        if bucket.isEmpty {
            buckets[h] = nil
        }
    }
    
    private mutating func resizeIfNeeded() {
        if Double(count) / Double(capacity) > 0.75 {
            resize(capacity: capacity * 2)
        }
    }
    
    private mutating func resize(capacity: Int)  {
        var temp = HashMap<Key, Value>(capacity: capacity)
        
        for bucket in buckets {
            if let bucket {
                for element in bucket {
                    temp[element.key] = element.value
                }
            }
        }
        
        self = temp
    }
    
}
