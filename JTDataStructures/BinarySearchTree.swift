//
//  BinarySearchTree.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/20/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


open class BinarySearchTree<T: Comparable> {
    
    open fileprivate(set) var root: BinarySearchTreeNode<T>?
    open fileprivate(set) var count = 0
    
    open func insert(_ value: T) {
        
        if let root = root {
            insert(root, value: value)
        } else {
            root = BinarySearchTreeNode(value: value)
        }
        
        count += 1
    }
    
    fileprivate func insert(_ currentNode: BinarySearchTreeNode<T>, value: T) {
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
    
    open func search(_ value: T) -> BinarySearchTreeNode<T>? {
        return search(root, value: value)
    }
    
    fileprivate func search(_ currentNode: BinarySearchTreeNode<T>?, value: T) -> BinarySearchTreeNode<T>? {
        if currentNode?.value == value || currentNode == nil {
            return currentNode
        }
        
        if value < currentNode?.value {
            return search(currentNode?.left, value: value)
        } else {
            return search(currentNode?.right, value: value)
        }
    }
    
    
    fileprivate func transplant(_ node: BinarySearchTreeNode<T>, child: BinarySearchTreeNode<T>?) {
        if node.isOrphan {
            root = child
        } else if node.isLeftChild {
            node.parent?.left = child
        } else {
            node.parent?.right = child
        }
        
        child?.parent = node.parent
    }
    
    open func remove(_ value: T) {
        if let node = search(value) {
            remove(node)
            count -= 1
        }
    }
    
    open func remove(_ node: BinarySearchTreeNode<T>) {
        if node.left == nil {
            transplant(node, child: node.right)
        } else if node.right == nil {
            transplant(node, child: node.left)
        } else if let successor = node.right?.minimum {
            if successor.parent !== node {
                transplant(successor, child: successor.right)
                successor.right = node.right
                successor.right?.parent = successor
            }
            transplant(node, child: successor)
            successor.left = node.left
            successor.left?.parent = successor
        }
    }
    

  
}
