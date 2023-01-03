//
//  DoublyLinkedList.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 10/24/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public class DoublyLinkedList<T> {
    
    public private(set) var first: DoublyLinkedListNode<T>?
    public private(set) var last: DoublyLinkedListNode<T>?
    
    public init() { }
    
    // O(1)
    public func insert(value: T) {
        let node = DoublyLinkedListNode(value: value)
        if first == nil {
            first = node
            last = node
        } else {
            last?.insert(node: node)
            last = node
        }
    }
    
    // O(1)
    public func remove(node: DoublyLinkedListNode<T>) {
        if node === first {
            first = node.next
        }
        
        if node === last {
            last = node.previous
        }
        
        node.previous?.next = node.next
        node.next?.previous = node.previous
    }
    
}

extension DoublyLinkedList: Sequence {
    
    public func makeIterator() -> DoublyLinkedListIterator<T> {
        DoublyLinkedListIterator(list: self)
    }
    
}
