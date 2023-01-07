//
//  HashMapTests.swift
//  JTDataStructuresTests
//
//  Created by Julian Tejera-Frias on 1/7/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import XCTest
@testable import JTDataStructures

final class HashMapTests: XCTestCase {

    func testSubscriptReturnsTheExpectedValue() {
        var hashmap = HashMap<String, String>()
        XCTAssertNil(hashmap["j"])
        hashmap["j"] = "julian"
        XCTAssertEqual(hashmap["j"], "julian")
    }
    
    func testSubscriptReplacesOldValues() {
        var hashmap = HashMap<String, String>()
        hashmap["j"] = "julian"
        hashmap["j"] = "😜"
        XCTAssertEqual(hashmap["j"], "😜")
        hashmap["j"] = nil
        XCTAssertNil(nil)
    }
    
    func testContains() {
        var hashmap = HashMap<String, String>()
        hashmap["j"] = "julian"
        XCTAssertFalse(hashmap.contains(key: "xyz"))
        XCTAssertTrue(hashmap.contains(key: "j"))
    }
    
    func testCount() {
        var hashmap = HashMap<String, String>()
        XCTAssertEqual(hashmap.count, 0)
        hashmap["i"] = "i"
        hashmap["x"] = "i"
        XCTAssertEqual(hashmap.count, 2)
        hashmap["z"] = "i"
        hashmap["i"] = "i"
        XCTAssertEqual(hashmap.count, 3)
        hashmap["x"] = nil
        XCTAssertEqual(hashmap.count, 2)
        hashmap["x"] = nil
        XCTAssertEqual(hashmap.count, 2)
    }
}
