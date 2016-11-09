//
//  Graph.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 11/8/16.
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

class Edge<T: Equatable> {
    let source: Vertex<T>
    var destination: Vertex<T>
    var weight: Int
    
    init(source: Vertex<T>, destination: Vertex<T>) {
        self.source = source
        self.destination = destination
        self.weight = 0
    }
    
    var isRelaxed: Bool {
        return !(destination.distance > source.distance + weight)
    }
   
    func relax() {
        if !isRelaxed {
            destination.distance = source.distance + weight
            destination.parent = source
        }
    }
    

}

struct Graph<T: Equatable> {
    
    private(set) var vertices = [Vertex<T>]()
    private(set) var edges = [Edge<T>]()
    
    mutating func insert(vertex: Vertex<T>) {
        vertices.append(vertex)
    }
    
    mutating func insert(edge: Edge<T>) {
        edges.append(edge)
    }
    
    func edges(vertex: Vertex<T>) -> [Edge<T>] {
        return edges.filter { $0.source.value == vertex.value }
    }
    
    func breathFirstSearch(source: Vertex<T>) {
        initializeSingleSource(source: source)
        var queue = Queue<Vertex<T>>()
        queue.enqueue(value: source)
        
        while !queue.isEmpty {
            guard let vertex = queue.dequeue() else {
                continue
            }
            for edge in edges(vertex: vertex) {
                if edge.destination.distance == Int.min {
                    edge.destination.distance = vertex.distance + 1
                    edge.destination.parent = vertex
                    queue.enqueue(value: edge.destination)
                }
            }
        }
    }
    
    func depthFirstSearch(source: inout Vertex<T>) {
        initializeSingleSource(source: source)
        var stack = Stack<Vertex<T>>()
        stack.push(value: source)
        
        while !stack.isEmpty {
            guard let vertex = stack.pop() else {
                continue
            }
            
            for edge in edges(vertex: vertex) {
                if edge.destination.distance == Int.min {
                    edge.destination.distance = vertex.distance + 1
                    edge.destination.parent = vertex
                    stack.push(value: edge.destination)
                }
            }
        }
    }
    
    
    // O(V + E)
    func topologicalSort(source: Vertex<T>) -> [Vertex<T>] {
        initializeSingleSource(source: source)
        var stack = Stack<Vertex<T>>()
        stack.push(value: source)
        
        var topologicallySortedVertices = [Vertex<T>]()
        while !stack.isEmpty {
            guard let vertex = stack.pop() else {
                continue
            }
            
            for edge in edges(vertex: vertex) {
                if edge.destination.distance == Int.min {
                    edge.destination.distance = vertex.distance + 1
                    edge.destination.parent = vertex
                    stack.push(value: edge.destination)
                }
            }
            topologicallySortedVertices.append(vertex)
        }
        
        return topologicallySortedVertices
    }
    
    
    // Returns true if there aren't any cycles
    // Supports negative weights
    // O(VE)
    func bellmanFordShortestPath(source: Vertex<T>) -> Bool {
        edges.forEach { $0.relax() }
        for edge in edges {
            if !edge.isRelaxed {
                return false
            }
        }
        
        return true
    }
    
    
    // Only works for directed acyclic graphs
    // O(V + E)
    func dagShortestPath(source: Vertex<T>) {
        let topologicallySortedVertices = self.topologicalSort(source: source)
        initializeSingleSource(source: source)
        for vertex in topologicallySortedVertices {
            for edge in edges(vertex: vertex) {
                edge.relax()
            }
        }
    }
    
    
    // Only works for non-negative weights
    func dijkstraShortestPath(source: Vertex<T>) {
        var queue = PriorityQueue<Vertex<T>> { (u, v) -> Bool in
            return v.distance < u.distance
        }
        source.distance = 0
        for vertex in vertices {
            if vertex !== source {
                vertex.distance = Int.max
                vertex.parent = nil
            }
            queue.enqueue(value: vertex)
        }
        
        while !queue.isEmpty {
            guard let vertex = queue.dequeue() else {
                continue
            }
            
            for edge in edges(vertex: vertex) {
                edge.relax()
            }
        }
        
    }
    
    
    private func initializeSingleSource(source: Vertex<T>) {
        for vertex in vertices {
            vertex.distance = Int.min
            vertex.parent = nil
        }
        source.distance = 0
    }
}
