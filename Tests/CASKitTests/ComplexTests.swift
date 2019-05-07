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
  
  func testSubtractingTwoComplexNumbers() {
    let a = Complex(real: 12, imaginary: -2)
    let b = Complex(real: 2, imaginary: 6)
    let c = Complex(real: 2.0, imaginary: 6.1)
    let d = Complex(real: 8.5, imaginary: 10.0)
    
    XCTAssertEqual(10, (a-b).real)
    XCTAssertEqual(-8, (a-b).imaginary)
    
    XCTAssert(Utils.nearlyEqual(a:0.0, b: (b-c).real))
    XCTAssert(Utils.nearlyEqual(a: -0.1, b: (b-c).imaginary))
    
    XCTAssert(Utils.nearlyEqual(a:0.0, b: (c-b).real))
    XCTAssert(Utils.nearlyEqual(a: 0.1, b: (c-b).imaginary))
    
    XCTAssert(Utils.nearlyEqual(a:-6.5, b: (c-d).real))
    XCTAssert(Utils.nearlyEqual(a: -3.9, b: (c-d).imaginary))
  }
  
  func testMultiplyingTwoComplexNumbers() {
    let a = Complex(real: 12, imaginary: -2)
    let b = Complex(real: 2, imaginary: 6)
    let c = Complex(real: 2.0, imaginary: 6.1)
    let d = Complex(real: 8.5, imaginary: 10.0)
    
    // (x + yi) * (u + vi) = (xu - yv) + (xv + yu)i
    XCTAssertEqual(36, (a*b).real)
    XCTAssertEqual(68, (a*b).imaginary)
    
    // 4 - 36.6 + 12.2 + 12
    XCTAssert(Utils.nearlyEqual(a:-32.6, b: (b*c).real))
    XCTAssert(Utils.nearlyEqual(a: 24.2, b: (b*c).imaginary))
    
    //        XCTAssert(Utils.nearlyEqual(a:0.0, b: (c*b).real))
    //        XCTAssert(Utils.nearlyEqual(a: 0.1, b: (c*b).imaginary))
    
    //    XCTAssert(Utils.nearlyEqual(a:-6.5, b: (c*d).real))
    //    XCTAssert(Utils.nearlyEqual(a: -3.9, b: (c*d).imaginary))
  }
}
