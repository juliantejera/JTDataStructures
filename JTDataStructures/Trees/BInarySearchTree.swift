//
//  BInarySearchTree.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 2/2/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import Foundation

final class BinarySearchTree<T: Comparable> {
    
    final class Node<T: Comparable> {
        let value: T
        var left: Node<T>?
        var right: Node<T>?
        var parent: Node<T>?
        
        var minimum: Node<T>? {
            var current = self
            while let left = current.left {
                current = left
            }
            return current
        }
        
        var maximum: Node<T>? {
            var current = self
            while let right = current.right {
                current = right
            }
            return current
        }
        
        var isOrphan: Bool {
            parent == nil
        }
        
        var isRightChild: Bool {
            parent?.right === self
        }
        
        var isLeftChild: Bool {
            parent?.left === self
        }
        
        // Next node visited in an inorder tree traversal
        var successor: Node<T>? {
            if let right {
                return right.minimum
            }
            
            var current = self
            while let parent = current.parent, current.isRightChild {
                current = parent
            }
            return current
        }
        
        // Previous node visited in an inorder tree traversal
        var predecessor: Node<T>? {
            if let left {
                return left.maximum
            }
            
            var current = self
            while let parent = current.parent, current.isLeftChild {
                current = parent
            }
            return current
        }
        
        init(_ value: T,
             left: Node<T>? = nil,
             right: Node<T>? = nil,
             parent: Node<T>? = nil) {
            self.value = value
            self.left = left
            self.right = right
            self.parent = parent
        }
        
        func search(value: T) -> Node<T>? {
            var current: Node<T>? = self
            
            while current != nil {
                if value < current!.value {
                    current = current?.left
                } else if value > current!.value {
                    current = current?.right
                } else {
                    return current
                }
            }

            return nil
        }
        
        func insert(value: T) {
            var current: Node<T>? = self
            
            while current != nil {
                if value <= current!.value {
                    if let left = current?.left {
                        current = left
                    } else {
                        current?.left = Node(value, parent: current)
                        break
                    }
                } else {
                    if let right = current?.right {
                        current = right
                    } else {
                        current?.right = Node(value, parent: current)
                        break
                    }
                }
            }
        }
        
    }
    
    private(set) var root: Node<T>?
    
    func insert(value: T) {
        guard let root else {
            root = Node(value)
            return
        }
        root.insert(value: value)
    }
    
    func search(value: T) -> Node<T>? {
        root?.search(value: value)
    }
    

   func remove(value: T) {
       guard let node = search(value: value) else {
           return
       }
       
       remove(node: node)
   }

   func remove(node: Node<T>) {
       if node.left == nil {
           transplant(node: node, child: node.right)
       } else if node.right == nil {
           transplant(node: node, child: node.left)
       } else if let successor = node.successor {
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
    
    private func transplant(node: Node<T>, child: Node<T>?) {
       if node.isOrphan {
           root = child
       } else if node.isLeftChild {
           node.parent?.left = child
       } else {
           node.parent?.right = child
       }

       child?.parent = node.parent
    }
    
    func inOrderTraversal(node: Node<T>?, operation: ((Node<T>) -> Void)? = nil) {
        guard let node else {
            return
        }
        
        inOrderTraversal(node: node.left, operation: operation)
        operation?(node)
        inOrderTraversal(node: node.right, operation: operation)
    }
    
    func preOrderTraversal(node: Node<T>?, operation: ((Node<T>) -> Void)? = nil) {
        guard let node else {
            return
        }

        operation?(node)
        preOrderTraversal(node: node.left, operation: operation)
        preOrderTraversal(node: node.right, operation: operation)
    }
    
    func postOrderTraversal(node: Node<T>?, operation: ((Node<T>) -> Void)? = nil){
        guard let node else {
            return
        }

        postOrderTraversal(node: node.left, operation: operation)
        postOrderTraversal(node: node.right, operation: operation)
        operation?(node)
    }
    
}
