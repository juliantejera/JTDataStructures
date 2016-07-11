//
//  Stack.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public class Stack<T> {
    
    private var top: Node<T>?
    
    public var isEmpty: Bool {
        return top == nil
    }
    
    public func push(value: T) {
        let node = Node(value: value)
        node.next = top
        top = node
    }
    
    public func pop() -> T? {
        let value = top?.value
        top = top?.next
        return value
    }
    
    public func peek() -> T? {
        return top?.value
    }
    
}