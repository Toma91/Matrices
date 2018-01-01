//
//  ColumnAddition.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ColumnAddition<T: Numeric> {
    
    private let lhs: ColumnVector<T>
    
    private let rhs: ColumnVector<T>
    
    
    init(lhs: ColumnVector<T>, rhs: ColumnVector<T>) {
        precondition(lhs.length == rhs.length)
        
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

extension ColumnAddition {
    
    var length: Int { return lhs.length }
    
}

extension ColumnAddition {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == lhs.length)
        
        for i in 0 ..< length { vector[i] = lhs[i] + rhs[i] }
    }
    
}
