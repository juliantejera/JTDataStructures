//
//  HashMapSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 11/2/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Quick
import Nimble
import JTDataStructures

class HashMapSpec: QuickSpec {
    
    override func spec() {
        
        describe("HashMap") {
            
            var hashmap: HashMap<String, String>!
            
            beforeEach {
                hashmap = HashMap<String, String>()
            }
            
            describe("subscript:get") {
                
                context("when the element is in the hash map") {
                    
                    beforeEach {
                        hashmap["j"] = "Julian"
                    }
                    
                    it("returns the value") {
                        expect(hashmap["j"]).to(equal("Julian"))
                    }
                }
                
                context("when the element is not in the hash map") {
                    
                    it("returns nil") {
                        expect(hashmap["j"]).to(beNil())
                    }
                }

            }
            
            describe("subscript:set") {
                
                context("when the same key is added multiple times") {
                    
                    beforeEach {
                        hashmap["j"] = "julian"
                        hashmap["j"] = "javier"
                    }
                    
                    it("updates the value") {
                        expect(hashmap["j"]).to(equal("javier"))
                    }
                }
                
                context("when the value is nil") {
                    
                    beforeEach {
                        hashmap["j"] = "julian"
                        hashmap["j"] = nil
                    }
                    
                    it("removes the key from the the hashmap") {
                        expect(hashmap["j"]).to(beNil())
                    }
                }

            }
            
            
            describe("contains") {
                
                context("when the key is in the hash") {
                    
                    beforeEach {
                        hashmap["j"] = "j"
                    }
                    
                    it("returns true") {
                        expect(hashmap.contains(key: "j")).to(beTrue())
                    }

                }
                
                context("when the key is not in the hash") {
                    
                    it("returns false") {
                        expect(hashmap.contains(key: "j")).to(beFalse())
                    }
                    
                }
                
            }
            
            describe("count") {
                
                context("when there are key values") {
                    
                    beforeEach {
                        hashmap["i"] = "i"
                        hashmap["x"] = "i"
                        hashmap["z"] = "i"
                        hashmap["i"] = "i"
                        hashmap["x"] = nil
                    }
                    
                    it("returns the correct value") {
                        expect(hashmap.count).to(equal(2))
                    }
                }
                
                context("when there arent any key values") {
                    
                    it("returns the correct value") {
                        expect(hashmap.count).to(equal(0))
                    }
                }

            }
        }
    }
    
}
