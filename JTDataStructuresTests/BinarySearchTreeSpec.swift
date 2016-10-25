//
//  BinarySearchTreeSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/28/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation
@testable import JTDataStructures

import Quick
import Nimble

class BinarySearchTreeSpec: QuickSpec {
    
    override func spec() {
        
        describe("BinarySearchTree") {
            
            var tree: BinarySearchTree<Int>!
            
            describe("insert") {
                
                beforeEach {
                    tree = BinarySearchTree<Int>()
                    tree.insert(value: 15)
                    tree.insert(value: 6)
                    tree.insert(value: 18)
                    tree.insert(value: 3)
                    tree.insert(value: 7)
                    tree.insert(value: 17)
                    tree.insert(value: 20)
                }
                
                it("adds element in the expected order") {
                    expect(tree.root?.value).to(equal(15))
                    expect(tree.root?.left?.value).to(equal(6))
                    expect(tree.root?.right?.value).to(equal(18))
                    expect(tree.root?.left?.left?.value).to(equal(3))
                    expect(tree.root?.left?.right?.value).to(equal(7))
                    expect(tree.root?.right?.left?.value).to(equal(17))
                    expect(tree.root?.right?.right?.value).to(equal(20))
                }
                
                it("increases the count of nodes") {
                    expect(tree.count).to(equal(7))
                }
            }
            
            describe("search") {
                
                context("when the value isn't in the tree") {
                    
                    beforeEach {
                        tree = BinarySearchTree<Int>()
                        tree.insert(value: 15)
                        tree.insert(value: 6)
                    }
                    
                    it("returns nil") {
                        expect(tree.search(value: 1)).to(beNil())
                    }
                }
                
                context("when the value is in the tree") {
                    beforeEach {
                        tree = BinarySearchTree<Int>()
                        tree.insert(value: 15)
                        tree.insert(value: 6)
                        tree.insert(value: 18)
                        tree.insert(value: 3)
                        tree.insert(value: 7)
                        tree.insert(value: 17)
                        tree.insert(value: 20)
                    }
                    
                    it("returns the node") {
                        expect(tree.search(value: 7)).to(beIdenticalTo(tree.root?.left?.right))
                    }
                }

            }
            
            describe("remove") {
                
                beforeEach {
                    tree = BinarySearchTree<Int>()
                    tree.insert(value: 7)
                    tree.insert(value: 2)
                    tree.insert(value: 10)
                    tree.insert(value: 1)
                    tree.insert(value: 5)
                    tree.insert(value: 9)
                }
                
                it("decreases the count of nodes") {
                    tree.remove(value: 9)
                    expect(tree.count).to(equal(5))
                }
                
                context("when the node to be removed is a leaf node") {
                    
                    beforeEach {
                        tree.remove(value: 5)
                    }
                    
                    it("removes the leaf node") {
                        expect(tree.search(value: 2)?.right).to(beNil())
                    }
                
                }
                
                context("when the node to be removed has only one child") {
                    
                    beforeEach {
                        tree.remove(value: 10)
                    }
                    
                    it("links that child to the parent node") {
                        let parent = tree.search(value: 7)!
                        let child = tree.search(value: 9)!
                        
                        expect(parent.right).to(beIdenticalTo(child))
                        expect(child.parent).to(beIdenticalTo(parent))
                    }
                    
                }
                
                
                context("when the node to be removed has two children") {
                    
                    beforeEach {
                        tree.remove(value: 2)
                    }
                    
                    it("replaces this node with the successor") {
                        let x = tree.search(value: 7)
                        let y = tree.search(value: 5)
                        let z = tree.search(value: 1)
                        expect(x?.left).to(beIdenticalTo(y))
                        expect(y?.parent).to(beIdenticalTo(x))
                        expect(y?.left).to(beIdenticalTo(z))
                        expect(z?.parent).to(beIdenticalTo(y))
                    }
                    
                }
                
                
                context("when the node to be removed has two children and is the root") {
                    
                    beforeEach {
                        tree.remove(value: 7)
                    }
                    
                    it("replaces this node with the successor") {
                        let x = tree.search(value: 9)
                        let y = tree.search(value: 10)
                        let z = tree.search(value: 2)
                        expect(x?.right).to(beIdenticalTo(y))
                        expect(y?.parent).to(beIdenticalTo(x))
                        expect(x?.left).to(beIdenticalTo(z))
                        expect(z?.parent).to(beIdenticalTo(x))
                    }
                    
                }
                
                
            }
        }
    }
    
}
