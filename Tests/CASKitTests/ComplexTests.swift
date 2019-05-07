//
//  ComplexTests.swift
//  CASKit
//
//  Created by Christian Roese on 5/7/19.
//

import XCTest
@testable import CASKit

final class ComplexTests: XCTestCase {
    func testThatItHasRealAndImaginaryParts() {
        let c = Complex(real: 42, imaginary: 12)
        
        XCTAssertEqual(42, c.real)
        XCTAssertEqual(12, c.imaginary)
    }
    
    func testComplexEquality() {
        let a = Complex(real: 2, imaginary: 3)
        let b = Complex(real: 2, imaginary: 3)
        let c = Complex(real: 5, imaginary: 3)
        
        XCTAssertEqual(a, b)
        XCTAssertNotEqual(a, c)
    }
    
    func testThatItHasAnAbsoluteValue() {
        let c = Complex(real: -3, imaginary: 4)
        
        XCTAssertEqual(5.0, c.abs)
        
        let d = Complex(real: 3.0, imaginary: -4.0)
        
        XCTAssertEqual(5.0, d.abs)
    }
    
    func testThatItHasAConjugate() {
        let a = Complex(real: 12, imaginary: -2)
        let b = a.conjugate
        
        XCTAssertEqual(12, b.real)
        XCTAssertEqual(2, b.imaginary)
        
        let c = Complex(real: 3.5, imaginary: 5.1)
        let d = c.conjugate
        
        XCTAssertEqual(3.5, d.real)
        XCTAssertEqual(-5.1, d.imaginary)
    }
    
    func testAddingTwoComplexNumbers() {
        let a = Complex(real: 12, imaginary: -2)
        let b = Complex(real: 2, imaginary: 6)
        let c = Complex(real: 2.0, imaginary: 6.1)
        let d = Complex(real: 8.5, imaginary: 10.0)
        
        XCTAssertEqual(14, (a+b).real)
        XCTAssertEqual(4, (a+b).imaginary)
        
        XCTAssertEqual(4.0, (b+c).real)
        XCTAssertEqual(12.1, (b+c).imaginary)
        
        XCTAssertEqual(4.0, (c+b).real)
        XCTAssertEqual(12.1, (c+b).imaginary)
        
        XCTAssertEqual(10.5, (c+d).real)
        XCTAssertEqual(16.1, (c+d).imaginary)
    }
}
