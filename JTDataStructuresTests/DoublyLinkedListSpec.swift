//
//  DoublyLinkedListSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 10/24/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import JTDataStructures

class DoublyLinkedListSpec: QuickSpec {
    
    override func spec() {
        
        describe("DoublyLinkedList") {
            
            var list: DoublyLinkedList<Int>!

            beforeEach {
                list = DoublyLinkedList<Int>()
            }
            
            describe("insert:value") {
                
                context("when there aren't any nodes in the list") {
                    
                    beforeEach {
                        list.insert(value: 1)
                    }
                    
                    it("sets the first node") {
                        expect(list.first?.value).to(equal(1))
                    }
                    
                    it("sets the last node") {
                        expect(list.last?.value).to(equal(1))
                    }

                }
                
                context("when multiple values are inserted") {
                    
                    beforeEach {
                        list = DoublyLinkedList<Int>()
                        list.insert(value: 1)
                        list.insert(value: 5)
                    }
                    
                    it("adds them in the correct order") {
                        expect(list.first?.value).to(equal(1))
                        expect(list.first?.next?.value).to(equal(5))
                    }
                
                }

            }
            
            describe("search:value") {
                
                context("when the value is not in the list") {
                    it("returns nil") {
                        expect(list.search(value: 100)).to(beNil())
                    }
                }
                
                context("when the value is in the list") {
                    
                    beforeEach {
                        list.insert(value: 5)
                        list.insert(value: 3)
                        list.insert(value: 4)
                    }
                    
                    it("returns the correct node") {                        
                        expect(list.search(value: 3)).to(beIdenticalTo(list.first?.next))
                    }
                }

            }
            
            describe("remove:value") {
                
                context("first element of the list") {
                    
                    beforeEach {
                        list.insert(value: 5)
                        list.insert(value: 3)
                        list.insert(value: 4)
                        list.remove(value: 5)
                    }
                    
                    it("has the correct first node") {
                        expect(list.search(value: 3)).to(beIdenticalTo(list.first))
                    }
                }
                
                context("first and only element of the list") {
                    
                    
                    beforeEach {
                        list.insert(value: 5)
                        list.remove(value: 5)
                    }
                    
                    it("has the correct first node") {
                        expect(list.search(value: 5)).to(beNil())
                    }
                }
                
                context("last element of the list") {
                    
                    
                    beforeEach {
                        list.insert(value: 5)
                        list.insert(value: 3)
                        list.insert(value: 4)
                        list.remove(value: 4)
                    }
                    
                    it("has the correct last node") {
                        expect(list.search(value: 3)).to(beIdenticalTo(list.last))
                    }
                    
                }
                
                context("middle element of the list") {
                    
                    beforeEach {
                        list.insert(value: 5)
                        list.insert(value: 3)
                        list.insert(value: 4)
                        list.remove(value: 3)
                    }
                    
                    it("has the correct first node") {
                        expect(list.search(value: 4)).to(beIdenticalTo(list.first?.next))
                        expect(list.search(value: 5)).to(beIdenticalTo(list.last?.previous))

                    }
                }
                
                context("when we try to remove an element is not in the list") {
                    
                    beforeEach {
                        list.insert(value: 5)
                        list.remove(value: 1)
                    }
                    
                    it("has the correct first node") {
                        expect(list.search(value: 5)).to(beIdenticalTo(list.first))
                    }
                    
                    
                    it("has the correct last node") {
                        expect(list.search(value: 5)).to(beIdenticalTo(list.last))
                    }
                }

                
            

            }
        }
    }
    
}
