//
//  DoublyLinkedListNode.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 10/25/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public class DoublyLinkedListNode<T> {
    
    public var value: T
    public var previous: DoublyLinkedListNode<T>?
    public var next: DoublyLinkedListNode<T>?
    
    public init(value: T) {
        self.value = value
    }
    
    public func insert(node: DoublyLinkedListNode<T>) {
        node.previous = self
        self.next = node
    }
    
}
