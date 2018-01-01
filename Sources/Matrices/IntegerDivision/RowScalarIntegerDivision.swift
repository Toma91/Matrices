//
//  RowScalarIntegerDivision.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct RowScalarIntegerDivision<T: BinaryInteger> {
    
    private let lhs: RowVector<T>

    private let rhs: T
    
    
    init(lhs: RowVector<T>, rhs: T) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

extension RowScalarIntegerDivision {
    
    var length: Int { return lhs.length }
    
}

extension RowScalarIntegerDivision {
 
    func execute(into vector: inout RowVector<T>) {
        precondition(vector.length == lhs.length)
        
        for i in 0 ..< length { vector[i] = lhs[i] / rhs }
    }
    
}
