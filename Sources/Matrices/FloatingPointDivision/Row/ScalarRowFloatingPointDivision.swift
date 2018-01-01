//
//  ScalarRowFloatingPointDivision.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ScalarRowFloatingPointDivision<T: FloatingPoint> {
    
    private let lhs: T
    
    private let rhs: RowVector<T>
    
    
    init(lhs: T, rhs: RowVector<T>) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ScalarRowFloatingPointDivision {
    
    var length: Int { return rhs.length }
    
}

extension ScalarRowFloatingPointDivision {
 
    func execute(into vector: inout RowVector<T>) {
        precondition(vector.length == rhs.length)
        
        for i in 0 ..< length { vector[i] = lhs / rhs[i] }
    }
    
}
