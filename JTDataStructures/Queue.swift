//
//  Queue.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/10/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public struct Queue<T> {
    
    fileprivate var head: Node<T>?
    fileprivate var tail: Node<T>?
    fileprivate(set) var count = 0
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func enqueue(value: T) {
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
        if head == nil {
            return nil
        }
        
        let value = head?.value
        head = head?.next
        if head == nil {
            tail = nil
        }
        
        count -= 1
        return value
    }

}
