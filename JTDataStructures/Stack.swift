//
//  Stack.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

open class Stack<T> {
    
    fileprivate var top: Node<T>?
    
    open var isEmpty: Bool {
        return top == nil
    }
    
    open func push(_ value: T) {
        let node = Node(value: value)
        node.next = top
        top = node
    }
    
    open func pop() -> T? {
        let value = top?.value
        top = top?.next
        return value
    }
    
    open func peek() -> T? {
        return top?.value
    }
    
}
