//
//  Factory.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/28/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation
import JTDataStructures

struct Factory {
    
    func createBinarySearchTreeNode(_ value: Int = Int(arc4random())) -> BinarySearchTreeNode<Int> {
        BinarySearchTreeNode(value: value)
    }
    
}
