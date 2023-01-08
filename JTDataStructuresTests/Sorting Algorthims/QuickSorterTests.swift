//
//  QuickSorterTests.swift
//  JTDataStructuresTests
//
//  Created by Julian Tejera-Frias on 1/8/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import XCTest
@testable import JTDataStructures

final class QuickSorterTests: XCTestCase {

    func testSortWithArrayWithNegativeNumbers() {
        var actualNumbers = [3, 4, 1, 5, 2, -10, -20]
        let expectedNumbers = [-20, -10, 1, 2, 3, 4, 5]
        QuickSorter<Int>.sort(&actualNumbers, low: 0, high: actualNumbers.count - 1)
        XCTAssertEqual(actualNumbers, expectedNumbers)
    }
    
    func testSortWithEmptyArray() {
        var actualNumbers: [Int] = []
        let expectedNumbers: [Int] = []
        QuickSorter<Int>.sort(&actualNumbers, low: 0, high: actualNumbers.count - 1)
        XCTAssertEqual(actualNumbers, expectedNumbers)
    }
    
    func testSortWithArrayWithOneElement() {
        var actualNumbers = [-10]
        let expectedNumbers = [-10]
        QuickSorter<Int>.sort(&actualNumbers, low: 0, high: actualNumbers.count - 1)
        XCTAssertEqual(actualNumbers, expectedNumbers)
    }
}
