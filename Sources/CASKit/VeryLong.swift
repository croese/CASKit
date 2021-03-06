//
//  VeryLong.swift
//  CASKit
//
//  Created by Christian Roese on 5/7/19.
//

import Foundation

public struct VeryLong: Equatable {
    private let number: String
    public let isNegative: Bool
    
    init(value: String = "0") {
        let s = value == "" ? "0" : value
        isNegative = s.hasPrefix("-")
        
        if isNegative {
            let index = s.index(after: s.startIndex)
            number = String(s[index...])
        } else {
            number = s
        }
    }
    
    init(value: Int) {
        isNegative = value < 0
        number = isNegative ? "\(-value)" : "\(value)"
    }
}

extension VeryLong: CustomStringConvertible {
    public var description: String {
        return isNegative ? "-\(number)" : number
    }
}
