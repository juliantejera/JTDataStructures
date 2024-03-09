//
//  CustomAssertions.swift
//  JTDataStructuresTests
//
//  Created by Julian Tejera-Frias on 2/2/23.
//  Copyright © 2023 Julian Tejera-Frias. All rights reserved.
//

import XCTest

struct UnexpectedNilValueError: Error {}

func JTAssertNotNilAndUnwrap<T>(_ value: Any?, message: String = "Unexpected nil value", file: StaticString = #file, line: UInt = #line) throws -> T {
    guard let value = value as? T else {
        XCTFail(message, file: file, line: line)
        throw UnexpectedNilValueError()
    }
    return value
}
