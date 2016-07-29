//
//  BinarySearchTree.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/20/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public class BinarySearchTree<T: Comparable> {
    
    public private(set) var root: BinarySearchTreeNode<T>?
    public private(set) var count = 0
    
    public func insert(value: T) {
        
        if let root = root {
            insert(root, value: value)
        } else {
            root = BinarySearchTreeNode(value: value)
        }
        
        count += 1
    }
    
    private func insert(currentNode: BinarySearchTreeNode<T>, value: T) {
        if value < currentNode.value {
            if let left = currentNode.left {
                insert(left, value: value)
            } else {
                currentNode.left = BinarySearchTreeNode(value: value)
                currentNode.left?.parent = currentNode
            }
        } else {
            if let right = currentNode.right {
                insert(right, value: value)
            } else {
                currentNode.right = BinarySearchTreeNode(value: value)
                currentNode.right?.parent = currentNode
            }
        }
        
    }
    
    public func search(value: T) -> BinarySearchTreeNode<T>? {
        return search(root, value: value)
    }
    
    private func search(currentNode: BinarySearchTreeNode<T>?, value: T) -> BinarySearchTreeNode<T>? {
        if currentNode?.value == value || currentNode == nil {
            return currentNode
        }
        
        if value < currentNode?.value {
            return search(currentNode?.left, value: value)
        } else {
            return search(currentNode?.right, value: value)
        }
    }
  
}