//
//  Trie.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 1/3/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import Foundation

struct Trie {
    final class Node {
        let value: Character
        var children: [Character: Trie.Node]
        var isTerminating: Bool
        
        subscript(char: Character) -> Trie.Node? {
            get {
                children[char]
            }
            set(newValue) {
                children[char] = newValue
            }
        }
        
        init(_ value: Character,
             children: [Character: Trie.Node] = [:],
             isTerminating: Bool = false) {
            self.value = value
            self.children = children
            self.isTerminating = isTerminating
        }
    }
    
    let root: Trie.Node
    
    init() {
        self.root = Trie.Node("*")
    }
    
    func insert(word: String) {
        var currentNode = root
        for char in word {
            if let child = currentNode[char] {
                currentNode = child
            } else {
                let newNode = Trie.Node(char)
                currentNode[char] = newNode
                currentNode = newNode
            }
        }
        currentNode.isTerminating = true
    }
    
    func isValid(prefix: String) -> Bool {
       node(with: prefix) != nil
    }
    
    private func node(with prefix: String) -> Trie.Node? {
        var currentNode = root
        
        for char in prefix {
            if let nextNode = currentNode[char] {
                currentNode = nextNode
            } else {
                return nil
            }
        }
        
        return currentNode
    }
    
    func words(with prefix: String) -> [String] {
        guard let prefixNode = node(with: prefix) else {
            return []
        }
        
        var result = [String]()
        if prefixNode.isTerminating {
            result.append(prefix)
        }
        wordsWithPrefixHelper(node: prefixNode, prefix: prefix, result: &result)
        return result
    }
    
    private func wordsWithPrefixHelper(node: Trie.Node, prefix: String, result: inout [String]) {
        for (key, child) in node.children {
            let word = "\(prefix)\(key)"
            if child.isTerminating {
                result.append(word)
            }
            wordsWithPrefixHelper(node: child, prefix: word, result: &result)
        }
    }

}
