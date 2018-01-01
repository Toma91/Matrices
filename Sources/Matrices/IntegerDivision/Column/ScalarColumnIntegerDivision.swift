//
//  ScalarColumnIntegerDivision.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ScalarColumnIntegerDivision<T: BinaryInteger> {
    
    private let lhs: T
    
    private let rhs: ColumnVector<T>
    
    
    init(lhs: T, rhs: ColumnVector<T>) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ScalarColumnIntegerDivision {
    
    var length: Int { return rhs.length }
    
}

extension ScalarColumnIntegerDivision {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = lhs / rhs[i] }
    }
    
}
