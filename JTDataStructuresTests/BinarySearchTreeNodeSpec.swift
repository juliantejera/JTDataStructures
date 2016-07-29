//
//  BinaryTreeNodeSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/28/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import JTDataStructures

class BinarySearchTreeNodeSpec: QuickSpec {
    
    override func spec() {
        
        describe("BinarySearchTreeNode") {
            
            let factory = Factory()
            var node: BinarySearchTreeNode<Int>!

            
            context("when the node doesn't have a parent") {
                
                beforeEach {
                    node = factory.createBinarySearchTreeNode()
                }
                
                it("is an orphan") {
                    expect(node.isOrphan).to(beTrue())
                }

            }
            
            
            context("when the node has a parent") {
                
                beforeEach {
                    node = factory.createBinarySearchTreeNode()
                    node.parent = factory.createBinarySearchTreeNode()
                }
                
                it("is not an ophan") {
                    expect(node.isOrphan).to(beFalse())
                }
            }
            
            
            context("when the node's parent left child is this node") {
                
                
                beforeEach {
                    node = factory.createBinarySearchTreeNode()
                    let parent = factory.createBinarySearchTreeNode()
                    parent.left = node
                    node.parent = parent
                }
                
                it("is the left child") {
                    expect(node.isLeftChild).to(beTrue())
                }

            }
            
            
            context("when the node's parent left child is this node") {
                
                beforeEach {
                    node = factory.createBinarySearchTreeNode()
                    let parent = factory.createBinarySearchTreeNode()
                    parent.right = node
                    node.parent = parent
                }
                
                it("is the right child") {
                    expect(node.isRightChild).to(beTrue())
                }
                
            }
            
            
            describe("depth") {
                
                beforeEach {
                    node = factory.createBinarySearchTreeNode()
                    node.parent = factory.createBinarySearchTreeNode()
                    node.parent?.parent = factory.createBinarySearchTreeNode()
                }
                
                it("is the number of ancestors") {
                    expect(node.depth).to(equal(2))
                }
            }
            
            describe("minimum") {
                
                
                beforeEach {
                    node = factory.createBinarySearchTreeNode(5)
                    node.right = factory.createBinarySearchTreeNode(6)
                    node.left = factory.createBinarySearchTreeNode(3)
                    node.left?.right = factory.createBinarySearchTreeNode(4)
                    node.left?.left = factory.createBinarySearchTreeNode(2)
                }
                
                it("is the last element of the left children") {
                    expect(node.minimum).to(beIdenticalTo(node.left?.left))
                }
            }
            
            
            describe("maximum") {
                
                
                beforeEach {
                    node = factory.createBinarySearchTreeNode(5)
                    node.right = factory.createBinarySearchTreeNode(6)
                    node.left = factory.createBinarySearchTreeNode(3)
                    node.left?.right = factory.createBinarySearchTreeNode(4)
                    node.left?.left = factory.createBinarySearchTreeNode(2)
                }
                
                it("is the last element of the right children") {
                    expect(node.maximum).to(beIdenticalTo(node.right))
                }
            }
            
            
            describe("successor") {
                
                var tree: BinarySearchTree<Int>!
                
                beforeEach {
                    tree = BinarySearchTree<Int>()
                    tree.insert(15)
                    tree.insert(6)
                    tree.insert(18)
                    tree.insert(3)
                    tree.insert(7)
                    tree.insert(17)
                    tree.insert(20)
                    tree.insert(2)
                    tree.insert(4)
                    tree.insert(13)
                    tree.insert(9)
                }
                
                context("when the right subtree of the node is nonempty") {
                    
                    beforeEach {
                        node = tree.root
                    }
                    
                    it("returns the minimum of the right child of the node") {
                        expect(node.successor?.value).to(equal(17))
                    }
                }
                
                context("when the right subtree of the node is empty") {
                    
                    beforeEach {
                        node = tree.search(13)
                    }
                    
                    it("returns the lowest ancestor whose left child is also an ancesor of the node") {
                        expect(node.successor?.value).to(equal(15))
                    }
                }
            }
            
            describe("predecessor") {
                
                var tree: BinarySearchTree<Int>!
                
                beforeEach {
                    tree = BinarySearchTree<Int>()
                    tree.insert(15)
                    tree.insert(6)
                    tree.insert(18)
                    tree.insert(3)
                    tree.insert(7)
                    tree.insert(17)
                    tree.insert(20)
                    tree.insert(2)
                    tree.insert(4)
                    tree.insert(13)
                    tree.insert(9)
                }
                
                context("when the left subtree of the node is nonempty") {
                    
                    beforeEach {
                        node = tree.root
                    }
                    
                    it("returns the maximum of the right child of the node") {
                        expect(node.predecessor?.value).to(equal(13))
                    }
                }
                
                context("when the right subtree of the node is empty") {
                    
                    beforeEach {
                        node = tree.search(9)
                    }
                    
                    it("returns the lowest ancestor whose right child is also an ancesor of the node") {
                        expect(node.predecessor?.value).to(equal(7))
                    }
                }
            }

        }
    }
    
}