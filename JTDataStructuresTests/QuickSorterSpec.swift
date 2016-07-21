//
//  QuickSorterSpec.swift
//  JTDataStructures
//
//  Created by Julian Tejera-Frias on 7/20/16.
//  Copyright © 2016 Julian Tejera. All rights reserved.
//

import Foundation

import Quick
import Nimble
@testable import JTDataStructures

class QuickSorterSpec: QuickSpec {
    
    override func spec() {
        
        describe("QuickSorter") {
            
            describe("sort") {
                
                it("orders the elements") {
                    var actualNumbers = [3, 4, 1, 5, 2, -10, -20]
                    let expectedNumbers = [-20, -10, 1, 2, 3, 4, 5]
                    QuickSorter<Int>().sort(&actualNumbers, low: 0, high: actualNumbers.count - 1)
                    expect(actualNumbers).to(equal(expectedNumbers))
                }
            }
            
            
        }
    }
    
}