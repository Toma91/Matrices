//
//  ScalarColumnMultiplication.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ScalarColumnMultiplication<T: Numeric> {
    
    private let lhs: T
    
    private let rhs: ColumnVector<T>
    
    
    init(lhs: T, rhs: ColumnVector<T>) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ScalarColumnMultiplication {
    
    var length: Int { return rhs.length }
    
}

extension ScalarColumnMultiplication {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = lhs * rhs[i] }
    }
    
}
