//
//  TrieTests.swift
//  JTDataStructuresTests
//
//  Created by Julian Tejera-Frias on 1/3/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import XCTest
@testable import JTDataStructures

final class TrieTests: XCTestCase {

    func testInsertWhenTrieIsEmpty() throws {
        let trie = Trie()
        trie.insert(word: "home")
        
        var current = trie.root
        XCTAssertFalse(current.isTerminating)
        current = try XCTUnwrap(current["h"])
        XCTAssertFalse(current.isTerminating)
        current = try XCTUnwrap(current["o"])
        XCTAssertFalse(current.isTerminating)
        current = try XCTUnwrap(current["m"])
        XCTAssertFalse(current.isTerminating)
        current = try XCTUnwrap(current["e"])
        XCTAssertTrue(current.isTerminating)
        XCTAssertEqual(current.children.count, 0)
    }
    
    func testInsertWhenTrieIsNotEmpty() throws {
        let trie = Trie()
        trie.insert(word: "home")
        trie.insert(word: "hot")
        trie.insert(word: "how")
        trie.insert(word: "howl")

        var current = trie.root
        current = try XCTUnwrap(current["h"])
        current = try XCTUnwrap(current["o"])
        
        // "home" exists
        XCTAssertNotNil(current["m"]?["e"])
        // "hot" exists
        XCTAssertNotNil(current["t"])
        // "how" exists
        XCTAssertNotNil(current["w"])
        // "howl" exists
        XCTAssertNotNil(current["w"]?["l"])
        // "hone" does not exists
        XCTAssertNil(current["n"]?["e"])
    }
    
    func testIsValidPrefix_whenItIsInvalid() {
        let trie = Trie()
        trie.insert(word: "home")
        XCTAssertFalse(trie.isValidPrefix(prefix: "war"))
    }
    
    func testIsValidPrefix_whenItIsValid() {
        let trie = Trie()
        trie.insert(word: "home")
        XCTAssertTrue(trie.isValidPrefix(prefix: "h"))
        XCTAssertTrue(trie.isValidPrefix(prefix: "ho"))
        XCTAssertTrue(trie.isValidPrefix(prefix: "hom"))
        XCTAssertTrue(trie.isValidPrefix(prefix: "home"))
    }
    
    func testWordsWithPrefix_whenThePrefixIsInvalid() {
        let trie = Trie()
        trie.insert(word: "home")
        XCTAssertEqual(trie.words(with: "war"), [])
    }
    
    func testWordsWithPrefix_whenThePrefixIsValid() {
        let trie = Trie()
        trie.insert(word: "home")
        trie.insert(word: "hot")
        trie.insert(word: "how")
        trie.insert(word: "howl")
        
        XCTAssertEqual(trie.words(with: "ho").sorted(), ["home", "hot", "how", "howl"].sorted())
    }
    
    func testWordsWithPrefix_whenThePrefixIsValid2() {
        let trie = Trie()
        trie.insert(word: "home")
        trie.insert(word: "hot")
        trie.insert(word: "how")
        trie.insert(word: "howl")
        
        XCTAssertEqual(trie.words(with: "how").sorted(), ["how", "howl"].sorted())
    }
    
}
