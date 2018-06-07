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
    public private(set) var count: Int
    
    public init() {
        self.count = 0
    }
    
    public func insert(value: T) {
        
        if let root = root {
            insert(currentNode: root, value: value)
        } else {
            root = BinarySearchTreeNode(value: value)
        }
        
        count += 1
    }
    
    private func insert(currentNode: BinarySearchTreeNode<T>, value: T) {
        if value < currentNode.value {
            if let left = currentNode.left {
                insert(currentNode: left, value: value)
            } else {
                currentNode.left = BinarySearchTreeNode(value: value)
                currentNode.left?.parent = currentNode
            }
        } else {
            if let right = currentNode.right {
                insert(currentNode: right, value: value)
            } else {
                currentNode.right = BinarySearchTreeNode(value: value)
                currentNode.right?.parent = currentNode
            }
        }
        
    }
    
    public func search(value: T) -> BinarySearchTreeNode<T>? {
        return search(currentNode: root, value: value)
    }
    
    private func search(currentNode: BinarySearchTreeNode<T>?, value: T) -> BinarySearchTreeNode<T>? {
        
        guard let currentNode = currentNode else {
            return nil
        }
        if currentNode.value == value {
            return currentNode
        } else if value < currentNode.value {
            return search(currentNode: currentNode.left, value: value)
        } else {
            return search(currentNode: currentNode.right, value: value)
        }
    }
    
    
    private func transplant(node: BinarySearchTreeNode<T>, child: BinarySearchTreeNode<T>?) {
        if node.isOrphan {
            root = child
        } else if node.isLeftChild {
            node.parent?.left = child
        } else {
            node.parent?.right = child
        }
        
        child?.parent = node.parent
    }
    
    public func remove(value: T) {
        if let node = search(value: value) {
            remove(node: node)
            count -= 1
        }
    }
    
    public func remove(node: BinarySearchTreeNode<T>) {
        if node.left == nil {
            transplant(node: node, child: node.right)
        } else if node.right == nil {
            transplant(node: node, child: node.left)
        } else if let successor = node.right?.minimum {
            if successor.parent !== node {
                transplant(node: successor, child: successor.right)
                successor.right = node.right
                successor.right?.parent = successor
            }
            transplant(node: node, child: successor)
            successor.left = node.left
            successor.left?.parent = successor
        }
    }
  
}
