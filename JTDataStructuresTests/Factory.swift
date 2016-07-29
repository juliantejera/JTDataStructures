//
//  Factory.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/28/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation
@testable import JTDataStructures

struct Factory {
    
    func createBinarySearchTreeNode(value: Int = random()) -> BinarySearchTreeNode<Int> {
        return BinarySearchTreeNode(value: value)
    }
    
}