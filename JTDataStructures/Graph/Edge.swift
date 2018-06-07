//
//  Edge.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 11/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public class Edge<T: Equatable> {
    
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public var weight: Double
    
    public init(source: Vertex<T>,
                destination: Vertex<T>, weight: Double = 0) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
    
    public var isRelaxed: Bool {
        return destination.distance <= source.distance + weight
    }
    
    public func relax() {
        if destination.distance > source.distance + weight {
            destination.distance = source.distance + weight
            destination.parent = source
        }
    }
    
}
