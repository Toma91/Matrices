//
//  RowScalarAddition.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct RowScalarAddition<T: Numeric> {
    
    private let lhs: RowVector<T>

    private let rhs: T
    
    
    init(lhs: RowVector<T>, rhs: T) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension RowScalarAddition {
    
    var length: Int { return lhs.length }
    
}

extension RowScalarAddition {
 
    func execute(into vector: inout RowVector<T>) {
        precondition(vector.length == lhs.length)
        
        for i in 0 ..< length { vector[i] = lhs[i] + rhs }
    }
    
}
