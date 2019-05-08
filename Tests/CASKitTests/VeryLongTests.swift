//
//  VeryLongTests.swift
//  CASKit
//
//  Created by Christian Roese on 5/7/19.
//

import XCTest
@testable import CASKit

final class VeryLongTests: XCTestCase {
    func testThatItCanBeCreatedFromAString() {
        var v = VeryLong()
        
        XCTAssertEqual("0", String(describing: v))
        
        v = VeryLong(value: "")
        
        XCTAssertEqual("0", String(describing: v))
    }
    
    func testThatItCanBePositive() {
        let v = VeryLong(value: "1234")
        
        XCTAssertEqual("1234", String(describing: v))
        XCTAssertFalse(v.isNegative)
    }
    
    func testThatItCanBeNegative() {
        let v = VeryLong(value: "-42")
        
        XCTAssertEqual("-42", String(describing: v))
        XCTAssertTrue(v.isNegative)
    }
    
    func testEquality() {
        let a = VeryLong(value: "123")
        let b = VeryLong(value: "123")
        
        XCTAssertEqual(a, b)
        
        let c = VeryLong(value: "42")
        
        XCTAssertNotEqual(a, c)
        
        let d = VeryLong(value: "-123")
        
        XCTAssertNotEqual(a, d)
    }
    
    func testThatItCanBeCreatedFromAnInt() {
        let v = VeryLong(value: -42)
        
        XCTAssertEqual("-42", String(describing: v))
    }
}
