//
//  BinarySearchTreeNode.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/21/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public class BinarySearchTreeNode<T: Comparable> {
    
    public var value: T
    public var parent: BinarySearchTreeNode?
    public var left: BinarySearchTreeNode?
    public var right: BinarySearchTreeNode?
    
    public var depth: Int {
        var i = 0
        var node = self
        while let parent = node.parent {
            node = parent
            i += 1
        }
        
        return i
    }
    
    public var hasChildren: Bool {
        return left != nil || right != nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var isOrphan: Bool {
        return parent == nil
    }
    
    public var minimum: BinarySearchTreeNode<T>? {
        var currentNode = self
        while let left = currentNode.left {
            currentNode = left
        }
        return currentNode
    }
    
    public var maximum: BinarySearchTreeNode<T>? {
        var currentNode = self
        while let right = currentNode.right {
            currentNode = right
        }
        return currentNode
    }
    
    public var successor: BinarySearchTreeNode<T>? {
        if let right = self.right {
            return right.minimum
        }
        
        var currentNode = self
        while let parent = currentNode.parent , currentNode.isRightChild {
            currentNode = parent
        }
        
        return currentNode.parent
    }
    
    public var predecessor: BinarySearchTreeNode<T>? {
        if let left = self.left {
            return left.maximum
        }
        
        var currentNode = self
        while let parent = currentNode.parent , currentNode.isLeftChild {
            currentNode = parent
        }
        
        return currentNode.parent
    }
    
    public init(value: T) {
        self.value = value
    }
    
}
