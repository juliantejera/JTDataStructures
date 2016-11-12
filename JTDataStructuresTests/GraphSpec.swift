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
                
                
                describe("vertex 1") {
                    
                    it("sets the correct distance") {
                        expect(graph.vertices[0].distance).to(equal(0))
                    }
                    
                    it("doesn't have a parent") {
                        expect(graph.vertices[0].parent).to(beNil())
                    }
                    
                }
                
                describe("vertex 2") {
                    it("sets the correct distance") {
                        expect(graph.vertices[1].distance).to(equal(1))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[1].parent).to(beIdenticalTo(graph.vertices[0]))
                    }
                }
                
                describe("vertex 3") {
                    it("sets the correct distance") {
                        expect(graph.vertices[2].distance).to(equal(1))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[2].parent).to(beIdenticalTo(graph.vertices[0]))
                    }
                }
                
                describe("vertex 4") {
                    it("sets the correct distance") {
                        expect(graph.vertices[3].distance).to(equal(2))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[3].parent).to(beIdenticalTo(graph.vertices[1]))
                    }
                }
                
                describe("vertex 5") {
                    it("sets the correct distance") {
                        expect(graph.vertices[4].distance).to(equal(1))
                    }
                    
                    it("has a parent") {
                        expect(graph.vertices[4].parent).to(beIdenticalTo(graph.vertices[0]))
                    }
                }
                
            }
            
            
            describe("Shortest Path Algorithms") {
                var airportsGraph: Graph<String>!
                var jfk: Vertex<String>!
                var sfo: Vertex<String>!
                var lga: Vertex<String>!
                var sdq: Vertex<String>!
                var atl: Vertex<String>!
                var mia: Vertex<String>!
                
                beforeEach {
                    airportsGraph = Graph<String>()
                    jfk = Vertex(value: "JFK")
                    sfo = Vertex(value: "SFO")
                    lga = Vertex(value: "LGA")
                    sdq = Vertex(value: "SDQ")
                    atl = Vertex(value: "ATL")
                    mia = Vertex(value: "MIA")
                    
                    airportsGraph.insert(vertex: mia)
                    airportsGraph.insert(vertex: jfk)
                    airportsGraph.insert(vertex: sfo)
                    airportsGraph.insert(vertex: lga)
                    airportsGraph.insert(vertex: sdq)
                    airportsGraph.insert(vertex: atl)
                    airportsGraph.insert(edge: Edge(source: jfk, destination: sfo, weight: 400))
                    airportsGraph.insert(edge: Edge(source: jfk, destination: mia, weight: 300))
                    airportsGraph.insert(edge: Edge(source: jfk, destination: sdq, weight: 500))
                    airportsGraph.insert(edge: Edge(source: mia, destination: atl, weight: 100))
                    airportsGraph.insert(edge: Edge(source: atl, destination: jfk, weight: 150))
                    airportsGraph.insert(edge: Edge(source: sdq, destination: mia, weight: 200))
                }
                
                describe("Dijkstra") {
                    beforeEach {
                        airportsGraph.dijkstraShortestPath(source: mia)
                    }
                    
                    describe("jfk") {
                        
                        it("has the correct distance") {
                            expect(jfk.distance).to(equal(250))
                        }
                        
                        it("has the correct parent") {
                            expect(jfk.parent).to(beIdenticalTo(atl))
                        }
                        
                    }
                    
                    describe("atl") {
                        
                        it("has the correct distance") {
                            expect(atl.distance).to(equal(100))
                        }
                        
                        it("has the correct parent") {
                            expect(atl.parent).to(beIdenticalTo(mia))
                        }
                        
                    }
                    
                    describe("sfo") {
                        
                        it("has the correct distance") {
                            expect(sfo.distance).to(equal(650))
                        }
                        
                        it("has the correct parent") {
                            expect(sfo.parent).to(beIdenticalTo(jfk))
                        }
                        
                    }
                    
                    describe("sdq") {
                        
                        it("has the correct distance") {
                            expect(sdq.distance).to(equal(750))
                        }
                        
                        it("has the correct parent") {
                            expect(sdq.parent).to(beIdenticalTo(jfk))
                        }
                        
                    }
                    
                    describe("mia") {
                        
                        it("has the correct distance") {
                            expect(mia.distance).to(equal(0))
                        }
                        
                        it("has the correct parent") {
                            expect(mia.parent).to(beNil())
                        }
                        
                    }

                }
                
                describe("DAG Shortest Path") {
                    
                    beforeEach {
                        airportsGraph.dagShortestPath(source: mia)
                    }
                    
                    describe("jfk") {
                        
                        it("has the correct distance") {
                            expect(jfk.distance).to(equal(250))
                        }
                        
                        it("has the correct parent") {
                            expect(jfk.parent).to(beIdenticalTo(atl))
                        }
                        
                    }
                    
                    describe("atl") {
                        
                        it("has the correct distance") {
                            expect(atl.distance).to(equal(100))
                        }
                        
                        it("has the correct parent") {
                            expect(atl.parent).to(beIdenticalTo(mia))
                        }
                        
                    }
                    
                    describe("sfo") {
                        
                        it("has the correct distance") {
                            expect(sfo.distance).to(equal(650))
                        }
                        
                        it("has the correct parent") {
                            expect(sfo.parent).to(beIdenticalTo(jfk))
                        }
                        
                    }
                    
                    describe("sdq") {
                        
                        it("has the correct distance") {
                            expect(sdq.distance).to(equal(750))
                        }
                        
                        it("has the correct parent") {
                            expect(sdq.parent).to(beIdenticalTo(jfk))
                        }
                        
                    }
                    
                    describe("mia") {
                        
                        it("has the correct distance") {
                            expect(mia.distance).to(equal(0))
                        }
                        
                        it("has the correct parent") {
                            expect(mia.parent).to(beNil())
                        }
                        
                    }
                    
                }
            }
        }
    }
    
}
