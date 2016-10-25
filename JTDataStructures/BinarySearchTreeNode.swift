//
//  BinarySearchTreeNode.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/21/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

open class BinarySearchTreeNode<T: Comparable> {
    
    open var value: T
    open var parent: BinarySearchTreeNode?
    open var left: BinarySearchTreeNode?
    open var right: BinarySearchTreeNode?
    
    open var depth: Int {
        var i = 0
        var node = self
        while let parent = node.parent {
            node = parent
            i += 1
        }
        
        return i
    }
    
    open var hasChildren: Bool {
        return left != nil || right != nil
    }
    
    open var isLeftChild: Bool {
        return parent?.left === self
    }
    
    open var isRightChild: Bool {
        return parent?.right === self
    }
    
    open var isOrphan: Bool {
        return parent == nil
    }
    
    open var minimum: BinarySearchTreeNode<T>? {
        var currentNode = self
        while let left = currentNode.left {
            currentNode = left
        }
        return currentNode
    }
    
    open var maximum: BinarySearchTreeNode<T>? {
        var currentNode = self
        while let right = currentNode.right {
            currentNode = right
        }
        return currentNode
    }
    
    open var successor: BinarySearchTreeNode<T>? {
        if let right = self.right {
            return right.minimum
        }
        
        var currentNode = self
        while let parent = currentNode.parent , currentNode.isRightChild {
            currentNode = parent
        }
        
        return currentNode.parent
    }
    
    open var predecessor: BinarySearchTreeNode<T>? {
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
