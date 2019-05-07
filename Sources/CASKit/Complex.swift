//
//  Complex.swift
//  CASKit
//
//  Created by Christian Roese on 5/7/19.
//

import Foundation

public struct Complex<T: Equatable>: Equatable {
  public let real: T
  public let imaginary: T
}

extension Complex where T == Int {
  public var abs: Double {
    return sqrt(Double(real * real + imaginary * imaginary))
  }
  
  public var conjugate: Complex<T> {
    return Complex(real: self.real, imaginary: -self.imaginary)
  }
  
  public static func + (left: Complex<Int>, right: Complex<Int>) -> Complex<Int> {
    return Complex(real: left.real + right.real, imaginary: left.imaginary + right.imaginary)
  }
  
  public static func + (left: Complex<Int>, right: Complex<Double>) -> Complex<Double> {
    return Complex<Double>(real: Double(left.real) + right.real,
                           imaginary: Double(left.imaginary) + right.imaginary)
  }
  
  public static func - (left: Complex<Int>, right: Complex<Int>) -> Complex<Int> {
    return Complex(real: left.real - right.real, imaginary: left.imaginary - right.imaginary)
  }
  
  public static func - (left: Complex<Int>, right: Complex<Double>) -> Complex<Double> {
    return Complex<Double>(real: Double(left.real) - right.real,
                           imaginary: Double(left.imaginary) - right.imaginary)
  }
  
  public static func * (left: Complex<Int>, right: Complex<Int>) -> Complex<Int> {
    return Complex(real: left.real * right.real - left.imaginary * right.imaginary,
                   imaginary: left.real * right.imaginary + left.imaginary * right.real)
  }
  
  public static func * (left: Complex<Int>, right: Complex<Double>) -> Complex<Double> {
    return Complex<Double>(real: Double(left.real) * right.real - Double(left.imaginary) * right.imaginary,
                           imaginary: Double(left.real) * right.imaginary + Double(left.imaginary) * right.real)
  }
}

extension Complex where T == Double {
  public var abs: Double {
    return sqrt(real * real + imaginary * imaginary)
  }
  
  public var conjugate: Complex<T> {
    return Complex(real: self.real, imaginary: -self.imaginary)
  }
  
  public static func + (left: Complex<Double>, right: Complex<Double>) -> Complex<Double> {
    return Complex(real: left.real + right.real,
                   imaginary: left.imaginary + right.imaginary)
  }
  
  public static func + (left: Complex<Double>, right: Complex<Int>) -> Complex<Double> {
    return Complex(real: left.real + Double(right.real),
                   imaginary: left.imaginary + Double(right.imaginary))
  }
  
  public static func - (left: Complex<Double>, right: Complex<Double>) -> Complex<Double> {
    return Complex(real: left.real - right.real,
                   imaginary: left.imaginary - right.imaginary)
  }
  
  public static func - (left: Complex<Double>, right: Complex<Int>) -> Complex<Double> {
    return Complex(real: left.real - Double(right.real),
                   imaginary: left.imaginary - Double(right.imaginary))
  }
  
  public static func * (left: Complex<Double>, right: Complex<Int>) -> Complex<Double> {
    return Complex(real: left.real * Double(right.real) - left.imaginary * Double(right.imaginary),
                   imaginary: left.real * Double(right.imaginary) + left.imaginary * Double(right.real))
  }
  
  public static func * (left: Complex<Double>, right: Complex<Double>) -> Complex<Double> {
    return Complex(real: left.real * right.real - left.imaginary * right.imaginary,
                   imaginary: left.real * right.imaginary + left.imaginary * right.real)
  }
}

