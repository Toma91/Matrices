//
//  ColumnScalarAddition.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ColumnScalarAddition<T: Numeric> {
    
    private let lhs: ColumnVector<T>

    private let rhs: T
    
    
    init(lhs: ColumnVector<T>, rhs: T) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

extension ColumnScalarAddition {
    
    var length: Int { return lhs.length }
    
}

extension ColumnScalarAddition {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == lhs.length)
        
        for i in 0 ..< length { vector[i] = lhs[i] + rhs }
    }
    
}
