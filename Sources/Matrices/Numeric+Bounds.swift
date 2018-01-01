//
//  Numeric+Bounds.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 31/12/17.
//

extension Numeric where Self: Comparable {
    
    func checkBounds(min: Self, max: Self) -> Bool {
        return self >= min && self < max
    }
    
}
