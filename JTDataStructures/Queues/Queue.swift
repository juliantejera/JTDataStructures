//
//  Queue.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/10/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public struct Queue<T> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    public private(set) var count: Int
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public init() {
        self.count = 0
    }
    
    public mutating func enqueue(_ value: T) {
        let node = Node(value: value)
        
        if head == nil {
            head = node
            tail = head
        } else {
            tail?.next = node
            tail = node
        }
        
        count += 1
    }
    
    public mutating func dequeue() -> T? {
        let value = head?.value
        head = head?.next
        if head == nil {
            tail = nil
        }
        
        count -= 1
        return value
    }
    
}
