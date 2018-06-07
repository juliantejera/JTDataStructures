//
//  Graph.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 11/8/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

public struct Graph<T: Equatable> {
    
    public private(set) var vertices: [Vertex<T>]
    public private(set) var edges: [Edge<T>]
    
    public init() {
        self.vertices = []
        self.edges = []
    }
    
    public mutating func insert(vertex: Vertex<T>) {
        vertices.append(vertex)
    }
    
    public mutating func insert(edge: Edge<T>) {
        edges.append(edge)
    }
    
    public func edges(vertex: Vertex<T>) -> [Edge<T>] {
        return edges.filter { $0.source.value == vertex.value }
    }
    
    // O(V + E)
    public func breathFirstSearch(source: Vertex<T>) {
        initializeSingleSource(source: source)
        var queue = Queue<Vertex<T>>()
        queue.enqueue(value: source)
        
        while !queue.isEmpty {
            if let vertex = queue.dequeue() {
                for edge in edges(vertex: vertex) {
                    if edge.destination.distance == Double.infinity {
                        edge.destination.distance = vertex.distance + 1
                        edge.destination.parent = vertex
                        queue.enqueue(value: edge.destination)
                    }
                }
            }
        }
        
    }
    
    // O(V + E)
    public func depthFirstSearch(source: Vertex<T>) {
        initializeSingleSource(source: source)
        var stack = Stack<Vertex<T>>()
        stack.push(value: source)
        
        while !stack.isEmpty {
            if let vertex = stack.pop() {
                for edge in edges(vertex: vertex) {
                    if edge.destination.distance == Double.infinity {
                        edge.destination.distance = vertex.distance + 1
                        edge.destination.parent = vertex
                        stack.push(value: edge.destination)
                    }
                }
            }
        }
    }
    
    // O(V + E)
    public func topologicalSort(source: Vertex<T>) -> [Vertex<T>] {
        initializeSingleSource(source: source)
        var stack = Stack<Vertex<T>>()
        stack.push(value: source)
        
        var topologicallySortedVertices = [Vertex<T>]()
        while !stack.isEmpty {
            if let vertex = stack.pop()  {
                for edge in edges(vertex: vertex) {
                    if edge.destination.distance == Double.infinity {
                        edge.destination.distance = vertex.distance + 1
                        edge.destination.parent = vertex
                        stack.push(value: edge.destination)
                    }
                }
                topologicallySortedVertices.append(vertex)
            }
        }
        
        return topologicallySortedVertices
    }
    
    
    // Returns true if there aren't any cycles
    // Supports negative weights
    // O(V * E)
    public func bellmanFordShortestPath(source: Vertex<T>) -> Bool {
        initializeSingleSource(source: source)
        
        for _ in 1..<vertices.count {
            edges.forEach {
                $0.relax()
            }
        }

        for edge in edges {
            if !edge.isRelaxed {
                return false
            }
        }
        
        return true
    }
    
    // Only works for directed acyclic graphs
    // O(V + E)
    public func dagShortestPath(source: Vertex<T>) {
        let topologicallySortedVertices = self.topologicalSort(source: source)
        initializeSingleSource(source: source)
        for vertex in topologicallySortedVertices {
            for edge in edges(vertex: vertex) {
                edge.relax()
            }
        }
    }
    
    
    // Only works for non-negative weights
    public func dijkstraShortestPath(source: Vertex<T>) {
        
        initializeSingleSource(source: source)
        var queue = PriorityQueue<Vertex<T>> { (u, v) -> Bool in
            return u.distance < v.distance
        }
        queue.enqueue(value: source)
        while !queue.isEmpty {
            if let vertex = queue.dequeue() {
                for edge in edges(vertex: vertex) {
                    if !edge.isRelaxed {
                        edge.relax()
                        queue.enqueue(value: edge.destination)
                    }
                }
            }
        }
        
    }
    
    private func initializeSingleSource(source: Vertex<T>) {
        for vertex in vertices {
            vertex.distance = Double.infinity
            vertex.parent = nil
        }
        source.distance = 0
    }
}
