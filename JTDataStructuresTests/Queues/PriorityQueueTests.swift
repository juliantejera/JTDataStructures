//
//  PriorityQueueTests.swift
//  JTDataStructuresTests
//
//  Created by Julian Tejera-Frias on 1/7/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import XCTest
@testable import JTDataStructures

final class PriorityQueueTests: XCTestCase {

    func testEnqueueUpdatesTheCountOfItems() {
        var priorityQueue = PriorityQueue<Int>(compare: >)
        priorityQueue.enqueue(10)
        priorityQueue.enqueue(5)
        priorityQueue.enqueue(6)
        priorityQueue.enqueue(25)
        XCTAssertEqual(priorityQueue.count, 4)
    }
    
    func testDequeueReturnsNilWhenItIsEmpty() {
        var priorityQueue = PriorityQueue<Int>(compare: >)
        XCTAssertNil(priorityQueue.dequeue())
    }
    
    func testDequeueReturnsTheElementsInTheRightOrder() {
        var priorityQueue = PriorityQueue<Int>(compare: >)
        priorityQueue.enqueue(10)
        priorityQueue.enqueue(5)
        priorityQueue.enqueue(25)
        priorityQueue.enqueue(6)
        priorityQueue.enqueue(1)
        priorityQueue.enqueue(100)
        priorityQueue.enqueue(75)
        priorityQueue.enqueue(30)
        for n in [100, 75, 30, 25, 10, 6, 5, 1] {
            XCTAssertEqual(priorityQueue.dequeue(), n)
        }
        XCTAssertNil(priorityQueue.dequeue())
    }
    
    func testCount() {
        var priorityQueue = PriorityQueue<Int>(compare: >)
        XCTAssertEqual(priorityQueue.count, 0)
        priorityQueue.enqueue(10)
        priorityQueue.enqueue(5)
        XCTAssertEqual(priorityQueue.count, 2)
        _ = priorityQueue.dequeue()
        XCTAssertEqual(priorityQueue.count, 1)
        _ = priorityQueue.dequeue()
        _ = priorityQueue.dequeue()
        XCTAssertEqual(priorityQueue.count, 0)
    }
    
    func testPeekReturnsNilWhenTheItIsEmpty() {
        let priorityQueue = PriorityQueue<Int>(compare: >)
        XCTAssertNil(priorityQueue.peek())
    }
    
    func testPeekReturnsTheExpectedFirstValue() {
        var priorityQueue = PriorityQueue<Int>(compare: >)
        priorityQueue.enqueue(1)
        priorityQueue.enqueue(100)
        XCTAssertEqual(priorityQueue.peek(), 100)
    }
    
    func testPeekDoesntReduceTheAmountOfElements() {
        var priorityQueue = PriorityQueue<Int>(compare: >)
        priorityQueue.enqueue(1)
        priorityQueue.enqueue(100)
        XCTAssertEqual(priorityQueue.peek(), 100)
        XCTAssertEqual(priorityQueue.count, 2)
    }

}
