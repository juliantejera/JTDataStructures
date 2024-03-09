//
//  BinarySearchTreeTests.swift
//  JTDataStructuresTests
//
//  Created by Julian Tejera-Frias on 2/2/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import XCTest
@testable import JTDataStructures

final class BinarySearchTreeTests: XCTestCase {

    func testInsertAddsElementsInTheExpectedOrder() {
        let root = BinarySearchTree<Int>.Node(15)
        root.insert(value: 6)
        root.insert(value: 18)
        root.insert(value: 3)
        root.insert(value: 7)
        root.insert(value: 17)
        root.insert(value: 20)
        
        XCTAssertEqual(root.value, 15)
        XCTAssertEqual(root.left?.value, 6)
        XCTAssertEqual(root.right?.value, 18)
        XCTAssertEqual(root.left?.left?.value, 3)
        XCTAssertEqual(root.left?.right?.value, 7)
        XCTAssertEqual(root.right?.left?.value, 17)
        XCTAssertEqual(root.right?.right?.value, 20)
    }
    
    func testRemoveWhenTargetIsALeafNode() {
        let tree = BinarySearchTree<Int>()
        [7, 2, 10, 1, 5, 9].forEach { n in
            tree.insert(value: n)
        }
        tree.remove(value: 5)
        XCTAssertNil(tree.search(value: 5))
        XCTAssertNil(tree.search(value: 2)?.right)
    }
    
    func testRemoveWhenTheNodeToBeRemovedOnlyHasOneChildItLinksTheChildToTheParentNode() {
        let tree = BinarySearchTree<Int>()
        [7, 2, 10, 1, 5, 9].forEach { n in
            tree.insert(value: n)
        }
        
        tree.remove(value: 10)
        let parent = tree.search(value: 7)!
        let child = tree.search(value: 9)!
        XCTAssertIdentical(parent.right, child)
        XCTAssertIdentical(child.parent, parent)
    }
    
    func testRemoveWhenTheNodeToBeRemovedHasTwoChildrenItReplacesTheNodeWithTheSuccessor() {
        let tree = BinarySearchTree<Int>()
        [7, 2, 10, 1, 5, 9].forEach { n in
            tree.insert(value: n)
        }
        
        tree.remove(value: 2)
        let x = tree.search(value: 7)
        let y = tree.search(value: 5)
        let z = tree.search(value: 1)
        XCTAssertIdentical(x?.left, y)
        XCTAssertIdentical(y?.parent, x)
        XCTAssertIdentical(y?.left, z)
        XCTAssertIdentical(z?.parent, y)
    }
    
    func testRemoveWhenTheNodeToBeRemovedHasTwoChildrenAndIsTheRootItReplacesTheNodeWithTheSuccessor() {
        let tree = BinarySearchTree<Int>()
        [7, 2, 10, 1, 5, 9].forEach { n in
            tree.insert(value: n)
        }
        
        tree.remove(value: 7)
        let x = tree.search(value: 9)
        let y = tree.search(value: 10)
        let z = tree.search(value: 2)
        XCTAssertIdentical(x?.right, y)
        XCTAssertIdentical(y?.parent, x)
        XCTAssertIdentical(x?.left, z)
        XCTAssertIdentical(z?.parent, x)
    }
}
