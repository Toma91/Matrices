//
//  ColumnScalarFloatingPointDivision.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ColumnScalarFloatingPointDivision<T: FloatingPoint> {
    
    private let lhs: ColumnVector<T>

    private let rhs: T
    
    
    init(lhs: ColumnVector<T>, rhs: T) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ColumnScalarFloatingPointDivision {
    
    var length: Int { return lhs.length }
    
}

extension ColumnScalarFloatingPointDivision {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = lhs[i] / rhs }
    }
    
}
