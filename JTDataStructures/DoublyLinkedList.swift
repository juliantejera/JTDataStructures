//
//  DoublyLinkedList.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 10/24/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

open class DoublyLinkedListNode<T: Equatable> {
    
    open var value: T
    open var previous: DoublyLinkedListNode<T>?
    open var next: DoublyLinkedListNode<T>?
    
    public init(value: T) {
        self.value = value
    }
    
    open func insert(node: DoublyLinkedListNode<T>) {
        node.previous = self
        self.next = node
    }
    
    open func search(value: T) -> DoublyLinkedListNode<T>? {
        if self.value == value {
            return self
        }
        
        return self.next?.search(value: value)
    }
    
}

open class DoublyLinkedList<T: Equatable> {
    
    var first: DoublyLinkedListNode<T>?
    var last: DoublyLinkedListNode<T>?
    
    // O(1)
    open func insert(value: T) {
        let node = DoublyLinkedListNode(value: value)
        if first == nil {
            first = node
            last = node
        } else {
            last?.insert(node: node)
            last = node
        }
    }
    
    // O(n)
    open func search(value: T) -> DoublyLinkedListNode<T>? {
        return first?.search(value: value)
    }
    
    // O(n)
    open func remove(value: T) {
        guard let node = search(value: value) else {
            return
        }
        
        remove(node: node)
    }
    
    // O(1)
    open func remove(node: DoublyLinkedListNode<T>) {
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
