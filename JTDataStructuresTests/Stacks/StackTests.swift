//
//  StackTests.swift
//  JTDataStructuresTests
//
//  Created by Julian Tejera-Frias on 1/7/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import XCTest
@testable import JTDataStructures

final class StackTests: XCTestCase {

    func testPushAddsElementsToTheStack() {
        var stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty)
        stack.push(value: 1)
        stack.push(value: 2)
        XCTAssertFalse(stack.isEmpty)
    }
    
    func testPopReturnsNilWhenTheStackIsEmpty() {
        var stack = Stack<Int>()
        XCTAssertNil(stack.pop())
    }
    
    func testPopReturnsElementsInLIFOOrder() {
        var stack = Stack<Int>()
        stack.push(value: 3)
        stack.push(value: 2)
        stack.push(value: 1)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 3)
        XCTAssertNil(stack.pop())
    }
    
    func testPeekReturnsNilWhenTheStackIsEmpty() {
        let stack = Stack<Int>()
        XCTAssertNil(stack.peek())
    }
    
    func testPeekReturnsTheElementAtTheTopOfTheStack() {
        var stack = Stack<Int>()
        stack.push(value: 3)
        stack.push(value: 2)
        XCTAssertEqual(stack.peek(), 2)
        XCTAssertEqual(stack.peek(), 2)
    }
}
