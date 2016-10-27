//
//  HashMap.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 10/26/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

struct KeyValueWrapper<Key: Hashable, Value>: Equatable {
    let key: Key
    var value: Value
}

func ==<Key: Hashable, Value>(lhs: KeyValueWrapper<Key,Value>, rhs: KeyValueWrapper<Key, Value>) -> Bool {
    return lhs.key == rhs.key
}

struct HashMap<Key: Hashable, Value> {
    
    
    typealias KeyValue = KeyValueWrapper<Key, Value>
    // Knuth suggests this constant, so it must be good! 🤔
    // The only requirement is the constant should be between 0 and 1
    let multiplicationMethodConstant: Double = (sqrt(5) - 1) / 2.0
    
    var capacity: Int
    var buckets: [DoublyLinkedList<KeyValue>]
    init(capacity: Int = 20) {
        self.capacity = capacity
        self.buckets = Array(repeating: DoublyLinkedList<KeyValue>(), count: capacity)
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
            update(key: key, value: value)
        }
    }
    
    private func search(key: Key) -> Value? {
        let h = hash(forKey: key)
        return buckets[h].filter { $0.value.key == key }.first?.value.value
    }
    
    func update(key: Key, value: Value?) {
        guard let value = value else {
            remove(key: key)
            return
        }
        
        
        if contains(key: key) {
            
        }
        let h = hash(forKey: key)
        let kv = KeyValue(key: key, value: value)
        buckets[h].insert(value: kv)
    }
    
    func contains(key: Key) -> Bool {
        let h = hash(forKey: key)
        return buckets[h].contains { $0.value.key == key }
    }
    
    func remove(key: Key) {
        let h = hash(forKey: key)
        if let node = buckets[h].filter({ $0.value.key == key }).first {
            buckets[h].remove(node: node)
        }
    }
    
}
