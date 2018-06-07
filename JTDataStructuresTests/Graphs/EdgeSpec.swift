//
//  EdgeSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 11/12/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Quick
import Nimble
import JTDataStructures

class EdgeSpec: QuickSpec {
    
    override func spec() {
        
        describe("Edge") {
            
            
            describe("relax") {
                
                context("when the edge is relaxed") {
                    
                    var edge: Edge<Int>!
                    
                    beforeEach {
                        let source = Vertex(value: 10)
                        source.distance = 5
                        let destination = Vertex(value: 20)
                        destination.distance = 2
                        edge = Edge(source: source, destination: destination, weight: 2)
                        edge.relax()
                    }
                    
                    it("doesnt change the distance of the destination") {
                        expect(edge.destination.distance).to(equal(2))
                    }
                    
                    it("doesnt change the parent of the destination") {
                        expect(edge.destination.parent).to(beNil())
                    }
                    
                }
                
                context("when the edge is not relaxed") {
                    var edge: Edge<Int>!
                    
                    beforeEach {
                        let source = Vertex(value: 10)
                        source.distance = 2
                        let destination = Vertex(value: 20)
                        destination.distance = 20
                        edge = Edge(source: source, destination: destination, weight: 2)
                        edge.relax()
                    }
                    
                    it("changes the distance of the destination") {
                        let expected = edge.source.distance + edge.weight
                        expect(edge.destination.distance).to(equal(expected))
                    }
                    
                    it("changes the parent of the destination") {
                        expect(edge.destination.parent).to(beIdenticalTo(edge.source))
                    }
                }


            }
            
            describe("isRelaxed") {
                
                context("when the distance of the destination is less than the source plus the weight of the edge") {
                    
                    var edge: Edge<Int>!
                    
                    beforeEach {
                        let source = Vertex(value: 10)
                        source.distance = 5
                        let destination = Vertex(value: 20)
                        destination.distance = 2
                        edge = Edge(source: source, destination: destination, weight: 2)
                    }
                    it("returns true") {
                        expect(edge.isRelaxed).to(beTrue())
                    }
                }
                
                context("when the distance of the destination is greater than the source plus the weight of the edge") {
                    
                    var edge: Edge<Int>!
                    
                    beforeEach {
                        let source = Vertex(value: 10)
                        source.distance = 2
                        let destination = Vertex(value: 20)
                        destination.distance = 20
                        edge = Edge(source: source, destination: destination, weight: 2)
                    }
                    it("returns false") {
                        expect(edge.isRelaxed).to(beFalse())
                    }
                }

            }
        }
    }
    
}
