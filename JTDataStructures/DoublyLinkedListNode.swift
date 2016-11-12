//
//  DoublyLinkedListNode.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 10/25/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

open class DoublyLinkedListNode<T> {
    
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
    
}
