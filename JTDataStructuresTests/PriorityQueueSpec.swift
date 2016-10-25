//
//  PriorityQueueSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

import Quick
import Nimble
@testable import JTDataStructures

class PriorityQueueSpec: QuickSpec {
    
    override func spec() {
        describe("PriorityQueue") {
            
            var priorityQueue: PriorityQueue<Int>!
            
            beforeEach {
                priorityQueue = PriorityQueue<Int>(compare: >)
            }
            
            describe("enqueue") {
                
                beforeEach {
                    priorityQueue.enqueue(value: 10)
                    priorityQueue.enqueue(value: 5)
                    priorityQueue.enqueue(value: 6)
                    priorityQueue.enqueue(value: 25)
                }
                
                it("enqueues the numbers in the heap") {
                    expect(priorityQueue.count).to(equal(4))
                }
            }
            
            describe("dequeue") {
                
                context("when the priority queue is empty") {
                    
                    it("returns nil") {
                        expect(priorityQueue.dequeue()).to(beNil())
                    }
                    
                }
                
                context("when the priority queue is not empty") {
                    
                    beforeEach {
                        priorityQueue.enqueue(value: 10)
                        priorityQueue.enqueue(value: 5)
                        priorityQueue.enqueue(value: 25)
                        priorityQueue.enqueue(value: 6)
                        priorityQueue.enqueue(value: 1)
                        priorityQueue.enqueue(value: 100)
                        priorityQueue.enqueue(value: 75)
                        priorityQueue.enqueue(value: 30)
                        
                    }
                    
                    it("returns the items in the right order") {
                        expect(priorityQueue.dequeue()).to(equal(100))
                        expect(priorityQueue.dequeue()).to(equal(75))
                        expect(priorityQueue.dequeue()).to(equal(30))
                        expect(priorityQueue.dequeue()).to(equal(25))
                        expect(priorityQueue.dequeue()).to(equal(10))
                        expect(priorityQueue.dequeue()).to(equal(6))
                        expect(priorityQueue.dequeue()).to(equal(5))
                        expect(priorityQueue.dequeue()).to(equal(1))
                    }
                    
                    it("reduces the amount of elements") {
                        priorityQueue.dequeue()
                        expect(priorityQueue.count).to(equal(7))
                    }
                    
                }

            }
            
            describe("peek") {
                
                context("when the priority queue is empty") {
                    
                    it("returns nil") {
                        expect(priorityQueue.peek()).to(beNil())
                    }
                }
                
                context("when the priority queue is not empty") {
                    
                    beforeEach {
                        priorityQueue.enqueue(value: 10)
                        priorityQueue.enqueue(value: 25)
                    }
                    
                    it("returns the first value of the queue") {
                        expect(priorityQueue.peek()).to(equal(25))
                    }
                    
                    it("does not reduce the count of elements") {
                        priorityQueue.peek()
                        expect(priorityQueue.count).to(equal(2))
                    }
                }


            }
            
            describe("isEmpty") {
                
                context("when the priorityQueue doesnt have any items") {
                    
                    it("returns true") {
                        expect(priorityQueue.isEmpty).to(beTrue())
                    }

                }
                
                context("when the priority queue has items") {
                    
                    beforeEach {
                        priorityQueue.enqueue(value: 5)
                    }
                    
                    it("returns false") {
                        expect(priorityQueue.isEmpty).to(beFalse())
                    }
                }


            }
        }
    }
    
}
