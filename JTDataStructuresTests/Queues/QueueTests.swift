//
//  QueueTests.swift
//  JTDataStructuresTests
//
//  Created by Julian Tejera-Frias on 1/7/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import XCTest
@testable import JTDataStructures

final class QueueTests: XCTestCase {

    func testEnqueueAddsElementsToTheQueue() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        XCTAssertEqual(queue.count, 4)
    }
    
    func testDequeuePopsTheElementsInRightOrder() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        for i in (1...4) {
            XCTAssertEqual(queue.dequeue(), i)
        }
    }
    
    func testDequeueUpdatesTheCountOfItems() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        _ = queue.dequeue()
        XCTAssertEqual(queue.count, 1)
        _ = queue.dequeue()
        _ = queue.dequeue()
        XCTAssertEqual(queue.count, 0)
    }
    
    func testIsEmptyReturnsTrueWhenTheQueueDoesntHaveAnyItems() {
        let queue = Queue<Int>()
        XCTAssertTrue(queue.isEmpty)
    }
    
    func testIsEmptyReturnsFalseWhenTheQueueHasItems() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        XCTAssertFalse(queue.isEmpty)
    }

}
