//
//  DoublyLinkedListIterator.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 6/7/18.
//  Copyright © 2018 Julian Tejera-Frias. All rights reserved.
//

import Foundation

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
