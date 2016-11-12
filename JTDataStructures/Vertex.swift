//
//  Vertex.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 11/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

class Vertex<T> {
    let value: T
    var parent: Vertex<T>?
    var distance: Int
    
    init(value: T) {
        self.value = value
        self.parent = nil
        self.distance = 0
    }
}
