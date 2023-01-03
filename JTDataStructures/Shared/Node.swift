//
//  Node.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/10/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

final class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(_ value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}
