//
//  Utils.swift
//  CASKit
//
//  Created by Christian Roese on 5/7/19.
//

import Foundation

struct Utils {
  public static let epsilon = 1e-14
  
  public static func nearlyEqual(a: Double, b: Double) -> Bool {
    return abs(a-b) < Utils.epsilon
  }
}
