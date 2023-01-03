//
//  Vertex.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 11/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public class Vertex<T> {
    public let value: T
    public weak var parent: Vertex<T>?
    public var distance: Double
    
    public init(value: T) {
        self.value = value
        self.parent = nil
        self.distance = 0
    }
}
