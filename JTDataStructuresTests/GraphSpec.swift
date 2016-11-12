//
//  GraphSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 11/11/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

import Quick
import Nimble
@testable import JTDataStructures
class GraphSpec: QuickSpec {
    
    override func spec() {
        
        describe("Graph") {
            
            var graph: Graph<Int>!
            
            beforeEach {
                graph = Graph<Int>()
            }
            
            describe("insert:vertex") {
                
                var vertex: Vertex<Int>!
                
                beforeEach {
                    vertex = Vertex(value: 1)
                    graph.insert(vertex: vertex)
                }
                
                it("adds the vertex to the vertices array") {
                    expect(graph.vertices[0]).to(beIdenticalTo(vertex))
                }
            }
            
            describe("insert:edge") {
                
                var edge: Edge<Int>!
                
                beforeEach {
                    let a = Vertex(value: 1)
                    let b = Vertex(value: 2)
                    graph.insert(vertex: a)
                    graph.insert(vertex: b)
                    edge = Edge(source: a, destination: b)
                    graph.insert(edge: edge)
                }
                
                it("adds the edge to the edges array") {
                    expect(graph.edges[0]).to(beIdenticalTo(edge))
                }
            }
            
            describe("edges:vertex") {
                
                var edges: [Edge<Int>]!
                
                beforeEach {
                    let a = Vertex(value: 1)
                    let b = Vertex(value: 2)
                    let c = Vertex(value: 3)
                    graph.insert(vertex: a)
                    graph.insert(vertex: b)
                    graph.insert(vertex: c)
                    graph.insert(edge: Edge(source: a, destination: b))
                    graph.insert(edge: Edge(source: a, destination: c))
                    graph.insert(edge: Edge(source: b, destination: c))
                    edges = graph.edges(vertex: a)
                }
                
                it("returns all the edges where the argument is the source") {
                    expect(edges.count).to(equal(2))
                    expect(edges[0].source.value).to(equal(1))
                    expect(edges[0].destination.value).to(equal(2))
                    expect(edges[1].source.value).to(equal(1))
                    expect(edges[1].destination.value).to(equal(3))
                }
            }
            
            describe("breathFirstSearch") {
                
                beforeEach {
                    let v1 = Vertex(value: 1)
                    let v2 = Vertex(value: 2)
                    let v3 = Vertex(value: 3)
                    let v4 = Vertex(value: 4)
                    let v5 = Vertex(value: 5)
                    graph.insert(vertex: v1)
                    graph.insert(vertex: v2)
                    graph.insert(vertex: v3)
                    graph.insert(vertex: v4)
                    graph.insert(vertex: v5)

                    graph.insert(edge: Edge(source: v1, destination: v2))
                    graph.insert(edge: Edge(source: v1, destination: v3))
                    graph.insert(edge: Edge(source: v2, destination: v4))
                    graph.insert(edge: Edge(source: v4, destination: v5))
                    graph.insert(edge: Edge(source: v1, destination: v5))
                    
                    graph.breathFirstSearch(source: v1)
                }
                
                
                context("vertex 1") {
                    
                    it("sets the correct distance") {
                        expect(graph.vertices[0].distance).to(equal(0))
                    }
                    
                    it("doesn't have a parent") {
                        expect(graph.vertices[0].parent).to(beNil())
                    }
                    
                }
                
                context("vertex 2") {
                    it("sets the correct distance") {
                        expect(graph.vertices[1].distance).to(equal(1))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[1].parent).to(beIdenticalTo(graph.vertices[0]))
                    }
                }

                context("vertex 3") {
                    it("sets the correct distance") {
                        expect(graph.vertices[2].distance).to(equal(1))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[2].parent).to(beIdenticalTo(graph.vertices[0]))
                    }
                }
                
                context("vertex 4") {
                    it("sets the correct distance") {
                        expect(graph.vertices[3].distance).to(equal(2))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[3].parent).to(beIdenticalTo(graph.vertices[1]))
                    }
                }
                
                context("vertex 5") {
                    it("sets the correct distance") {
                        expect(graph.vertices[4].distance).to(equal(1))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[4].parent).to(beIdenticalTo(graph.vertices[0]))
                    }
                }
                
            }
            
            describe("depthFirstSearch") {
                beforeEach {
                    let v1 = Vertex(value: 1)
                    let v2 = Vertex(value: 2)
                    let v3 = Vertex(value: 3)
                    let v4 = Vertex(value: 4)
                    let v5 = Vertex(value: 5)
                    graph.insert(vertex: v1)
                    graph.insert(vertex: v2)
                    graph.insert(vertex: v3)
                    graph.insert(vertex: v4)
                    graph.insert(vertex: v5)
                    
                    graph.insert(edge: Edge(source: v1, destination: v2))
                    graph.insert(edge: Edge(source: v1, destination: v3))
                    graph.insert(edge: Edge(source: v2, destination: v4))
                    graph.insert(edge: Edge(source: v4, destination: v5))
                    graph.insert(edge: Edge(source: v1, destination: v5))
                    
                    graph.depthFirstSearch(source: v1)
                }
                
                
                context("vertex 1") {
                    
                    it("sets the correct distance") {
                        expect(graph.vertices[0].distance).to(equal(0))
                    }
                    
                    it("doesn't have a parent") {
                        expect(graph.vertices[0].parent).to(beNil())
                    }
                    
                }
                
                context("vertex 2") {
                    it("sets the correct distance") {
                        expect(graph.vertices[1].distance).to(equal(1))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[1].parent).to(beIdenticalTo(graph.vertices[0]))
                    }
                }
                
                context("vertex 3") {
                    it("sets the correct distance") {
                        expect(graph.vertices[2].distance).to(equal(1))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[2].parent).to(beIdenticalTo(graph.vertices[0]))
                    }
                }
                
                context("vertex 4") {
                    it("sets the correct distance") {
                        expect(graph.vertices[3].distance).to(equal(2))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[3].parent).to(beIdenticalTo(graph.vertices[1]))
                    }
                }
                
                context("vertex 5") {
                    it("sets the correct distance") {
                        expect(graph.vertices[4].distance).to(equal(1))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[4].parent).to(beIdenticalTo(graph.vertices[0]))
                    }
                }
                
            }
        }
    }
    
}
