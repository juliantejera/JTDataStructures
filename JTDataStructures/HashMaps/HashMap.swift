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
    var buckets: [DoublyLinkedList<KeyValue>?]
    
    init(capacity: Int = 20) {
        self.capacity = capacity
        self.buckets = Array(repeating: nil, count: capacity)
    }
    
    // Uses multiplication method to create hash
    // h(k) = floor( m * (k * A mod 1) )
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
    
    private mutating func bucket(forHash h: Int) -> DoublyLinkedList<KeyValue> {
        if buckets[h] == nil {
            buckets[h] = DoublyLinkedList<KeyValue>()
        }
        
        return buckets[h]!
    }
    
    private func search(key: Key) -> Value? {
        let h = hash(forKey: key)
        return buckets[h]?.filter { $0.value.key == key }.first?.value.value
    }
    
    private mutating func upsert(key: Key, value: Value?) {
        guard let value = value else {
            // If we're trying to set the value to nil
            remove(key: key)
            return
        }
        
        let h = hash(forKey: key)
        let list = bucket(forHash: h)
        
        // Update node if it exists
        for node in list {
            if node.value.key == key {
                node.value.value = value
                return
            }
        }

        // Otherwise create a new node
        list.insert(value: KeyValue(key: key, value: value))
        count += 1
        resizeIfNeeded()
    }
    
    func contains(key: Key) -> Bool {
        let h = hash(forKey: key)
        return buckets[h]?.contains { $0.value.key == key } == true
    }
    
    mutating func remove(key: Key) {
        let h = hash(forKey: key)
        
        guard let list = buckets[h], let node = list.filter({ $0.value.key == key }).first else {
            return
        }
        
        list.remove(node: node)
        buckets[h] = list.first == nil ? nil : list
        count -= 1
    }
    
    private mutating func resizeIfNeeded() {
        if Double(count) / Double(capacity) > 0.75 {
            resize(capacity: capacity * 2)
        }
    }
    
    private mutating func resize(capacity: Int)  {
        var temp = HashMap<Key, Value>(capacity: capacity)
        
        for list in buckets {
            if let list = list {
                for node in list {
                    let keyValue = node.value
                    temp[keyValue.key] = keyValue.value
                }
            }
        }
        
        self = temp
    }
    
}
