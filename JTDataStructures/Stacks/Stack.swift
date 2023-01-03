//
//  Stack.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public struct Stack<T> {
    
    private var top: Node<T>?
    
    public var isEmpty: Bool {
        top == nil
    }
    
    public init() { }
    
    public mutating func push(value: T) {
        top = Node(value, next: top)
    }
    
    public mutating func pop() -> T? {
        let value = top?.value
        top = top?.next
        return value
    }
    
    public func peek() -> T? {
        top?.value
    }
    
}
