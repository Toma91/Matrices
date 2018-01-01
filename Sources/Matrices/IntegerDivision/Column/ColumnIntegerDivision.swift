//
//  ColumnIntegerDivision.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ColumnIntegerDivision<T: BinaryInteger> {
    
    private let lhs: ColumnVector<T>
    
    private let rhs: ColumnVector<T>
    
    
    init(lhs: ColumnVector<T>, rhs: ColumnVector<T>) {
        precondition(lhs.length == rhs.length)
        
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ColumnIntegerDivision {
    
    var length: Int { return lhs.length }
    
}

extension ColumnIntegerDivision {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = lhs[i] / rhs[i] }
    }
    
}
