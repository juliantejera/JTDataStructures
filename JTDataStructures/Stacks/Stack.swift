//
//  Stack.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

struct Stack<T> {
    
    private var top: Node<T>?
    
    var isEmpty: Bool {
        top == nil
    }
    
    init() { }
    
    mutating func push(value: T) {
        top = Node(value, next: top)
    }
    
    mutating func pop() -> T? {
        let value = top?.value
        top = top?.next
        return value
    }
    
    func peek() -> T? {
        top?.value
    }
    
}
