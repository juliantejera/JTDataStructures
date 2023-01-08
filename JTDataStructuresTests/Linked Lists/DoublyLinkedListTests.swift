//
//  DoublyLinkedListTests.swift
//  JTDataStructuresTests
//
//  Created by Julian Tejera-Frias on 1/8/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import XCTest
@testable import JTDataStructures

final class DoublyLinkedListTests: XCTestCase {
    
    func testInsertSetsTheFirstNodeWhenThereArentAnyNodesInTheList() {
        let list = DoublyLinkedList<Int>()
        list.insert(value: 1)
        XCTAssertEqual(list.first?.value, 1)
    }
    
    func testInsertSetsTheLastNodeWhenThereArentAnyNodesInTheList() {
        let list = DoublyLinkedList<Int>()
        list.insert(value: 1)
        XCTAssertEqual(list.last?.value, 1)
    }
    
    func testInsertAddsValuesInTheExpectedOrder() {
        let list = DoublyLinkedList<Int>()
        list.insert(value: 1)
        list.insert(value: 5)
        XCTAssertEqual(list.first?.value, 1)
        XCTAssertEqual(list.first?.next?.value, 5)
    }
    
    func testSearchReturnsNilWhenTheValueIsNotInTheList() {
        let list = DoublyLinkedList<Int>()
        list.insert(value: 1)
        XCTAssertNil(list.first(where: { $0.value == 3 }))
    }
    
    func testSearchReturnsTheCorrectNode() {
        let list = DoublyLinkedList<Int>()
        list.insert(value: 5)
        list.insert(value: 3)
        list.insert(value: 4)
        XCTAssertIdentical(list.first(where: { $0.value == 3 }), list.first?.next)
    }
    
    func testRemoveOnFirstElement() {
        let list = DoublyLinkedList<Int>()
        list.insert(value: 5)
        list.insert(value: 3)
        list.insert(value: 4)
        if let node = list.first {
            list.remove(node: node)
        }
        XCTAssertEqual(list.first?.value, 3)
    }
    
    func testRemoveOnFirstAndOnlyElement() throws {
        let list = DoublyLinkedList<Int>()
        list.insert(value: 5)
        list.remove(node: try XCTUnwrap(list.first))
        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
    }
    
    func testRemoveOnLastElement() throws {
        let list = DoublyLinkedList<Int>()
        list.insert(value: 5)
        list.insert(value: 3)
        list.insert(value: 4)
        list.remove(node: try XCTUnwrap(list.last))
        XCTAssertEqual(list.last?.value, 3)
    }
    
    func testRemoveOnMiddleElement() throws {
        let list = DoublyLinkedList<Int>()
        list.insert(value: 5)
        list.insert(value: 3)
        list.insert(value: 4)
        list.remove(node: try XCTUnwrap(list.first?.next))
        XCTAssertEqual(list.first?.next?.value, 4)
        XCTAssertEqual(list.last?.previous?.value, 5)
    }
}
