//
//  QueueSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/10/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Quick
import Nimble
import JTDataStructures

class QueueSpec: QuickSpec {
    
    override func spec() {
        
        describe("Queue") {
            var queue: Queue<Int>!
            
            describe("enqueue") {
                
                beforeEach {
                    queue = Queue<Int>()
                    queue.enqueue(value: 1)
                    queue.enqueue(value: 2)
                    queue.enqueue(value: 3)
                    queue.enqueue(value: 4)
                }
                
                it("adds the elements to the queue") {
                    expect(queue.count).to(equal(4))
                }
                
            }
            
            describe("dequeue") {
                
                context("when the queue isn't empty") {
                    
                    beforeEach {
                        queue = Queue<Int>()
                        queue.enqueue(value: 1)
                        queue.enqueue(value: 2)
                        queue.enqueue(value: 3)
                        queue.enqueue(value: 4)
                    }
                    
                    it("dequeues the elements in the right order") {
                        expect(queue.dequeue()).to(equal(1))
                        expect(queue.dequeue()).to(equal(2))
                        expect(queue.dequeue()).to(equal(3))
                        expect(queue.dequeue()).to(equal(4))
                    }
                    
                    it("updates the count of items") {
                        _ = queue.dequeue()
                        _ = queue.dequeue()
                        expect(queue.count).to(equal(2))
                    }
                    
                }
                
                context("when the queue is empty") {
                    
                    beforeEach {
                        queue = Queue<Int>()
                    }
                    
                    it("returns nil") {
                        expect(queue.dequeue()).to(beNil())
                    }
                }
                
            }
            
            describe("isEmpty") {
                
                context("when the queue doesn't have any items") {
                    
                    beforeEach {
                        queue = Queue<Int>()
                    }
                    
                    it("returns true") {
                        expect(queue.isEmpty).to(beTrue())
                    }

                }
                
                context("when the queue has items") {
                    
                    beforeEach {
                        queue = Queue<Int>()
                        queue.enqueue(value: 1)
                    }
                    
                    it("returns false") {
                        expect(queue.isEmpty).to(beFalse())
                    }
                }


            }
            
        }
    }
    
}
