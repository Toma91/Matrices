//
//  ColumnMultiplication.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ColumnMultiplication<T: Numeric> {
    
    private let lhs: ColumnVector<T>
    
    private let rhs: ColumnVector<T>
    
    
    init(lhs: ColumnVector<T>, rhs: ColumnVector<T>) {
        precondition(lhs.length == rhs.length)
        
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ColumnMultiplication {
    
    var length: Int { return lhs.length }
    
}

extension ColumnMultiplication {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = lhs[i] * rhs[i] }
    }
    
}
