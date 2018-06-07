//
//  StackSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Quick
import Nimble
import JTDataStructures

class StackSpec: QuickSpec {
    
    override func spec() {
        
        describe("Stack") {
            
            var stack: Stack<Int>!
            
            describe("push") {
                
                beforeEach {
                    stack = Stack<Int>()
                    stack.push(value: 1)
                    stack.push(value: 2)
                }
                
                it("adds elements to the stack") {
                    expect(stack.isEmpty).to(beFalse())
                }
            }
            
            describe("pop") {
                
                context("when the stack is empty") {
                    
                    beforeEach {
                        stack = Stack<Int>()
                    }
                    
                    it("returns nil") {
                        expect(stack.pop()).to(beNil())
                    }
                }
                
                context("when the stack has elements") {
                    
                    beforeEach {
                        stack = Stack<Int>()
                        stack.push(value: 3)
                        stack.push(value: 2)
                        stack.push(value: 1)
                    }
                    
                    it("pops them in the right order") {
                        expect(stack.pop()).to(equal(1))
                        expect(stack.pop()).to(equal(2))
                        expect(stack.pop()).to(equal(3))
                    }
                }


            }
            
            describe("peek") {
                
                context("when its empty") {
                    
                    beforeEach {
                        stack = Stack<Int>()
                    }
                    
                    it("returns nil") {
                        expect(stack.peek()).to(beNil())
                    }
                }
                
                context("when it has elements") {
                    
                    beforeEach {
                        stack = Stack<Int>()
                        stack.push(value: Int.max)
                    }
                    it("returns the one at the top") {
                        expect(stack.peek()).to(equal(Int.max))
                    }
                    
                }


            }
            
        }
    }
    
}
