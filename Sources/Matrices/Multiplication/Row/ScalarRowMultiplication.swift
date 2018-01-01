//
//  ScalarRowMultiplication.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ScalarRowMultiplication<T: Numeric> {
    
    private let lhs: T
    
    private let rhs: RowVector<T>
    
    
    init(lhs: T, rhs: RowVector<T>) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ScalarRowMultiplication {
    
    var length: Int { return rhs.length }
    
}

extension ScalarRowMultiplication {
 
    func execute(into vector: inout RowVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = lhs * rhs[i] }
    }
    
}
