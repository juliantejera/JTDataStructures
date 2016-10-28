//
//  DoublyLinkedList.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 10/24/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

open class DoublyLinkedList<T>: Sequence {
    
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
    
    // MARK: - Sequence
    open func makeIterator() -> DoublyLinkedListIterator<T> {
        return DoublyLinkedListIterator(list: self)
    }
}


public struct DoublyLinkedListIterator<T>: IteratorProtocol {
    
    private let list: DoublyLinkedList<T>
    private var currentNode: DoublyLinkedListNode<T>?
    
    public init(list: DoublyLinkedList<T>) {
        self.list = list
        self.currentNode = list.first
    }
    
    public mutating func next() -> DoublyLinkedListNode<T>? {
        let node = currentNode
        currentNode = currentNode?.next
        return node
    }
}
