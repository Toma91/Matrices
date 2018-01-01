//
//  RowScalarSubtraction.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct RowScalarSubtraction<T: Numeric> {
    
    private let lhs: RowVector<T>

    private let rhs: T
    
    
    init(lhs: RowVector<T>, rhs: T) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension RowScalarSubtraction {
    
    var length: Int { return lhs.length }
    
}

extension RowScalarSubtraction {
 
    func execute(into vector: inout RowVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = lhs[i] - rhs }
    }
    
}
