//
//  Edge.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 11/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

class Edge<T: Equatable> {
    
    let source: Vertex<T>
    var destination: Vertex<T>
    var weight: Int
    
    init(source: Vertex<T>, destination: Vertex<T>, weight: Int = 0) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
    
    var isRelaxed: Bool {
        return destination.distance < source.distance + weight
    }
    
    func relax() {
        if destination.distance > source.distance + weight {
            destination.distance = source.distance + weight
            destination.parent = source
        }
    }
    
}
