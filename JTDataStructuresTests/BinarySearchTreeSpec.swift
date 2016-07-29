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
                    tree.insert(15)
                    tree.insert(6)
                    tree.insert(18)
                    tree.insert(3)
                    tree.insert(7)
                    tree.insert(17)
                    tree.insert(20)
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
                        tree.insert(15)
                        tree.insert(6)
                    }
                    
                    it("returns nil") {
                        expect(tree.search(1)).to(beNil())
                    }
                }
                
                context("when the value is in the tree") {
                    beforeEach {
                        tree = BinarySearchTree<Int>()
                        tree.insert(15)
                        tree.insert(6)
                        tree.insert(18)
                        tree.insert(3)
                        tree.insert(7)
                        tree.insert(17)
                        tree.insert(20)
                    }
                    
                    it("returns the node") {
                        expect(tree.search(7)).to(beIdenticalTo(tree.root?.left?.right))
                    }
                }

            }
        }
    }
    
}