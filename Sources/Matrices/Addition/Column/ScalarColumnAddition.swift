//
//  ScalarColumnAddition.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ScalarColumnAddition<T: Numeric> {
    
    private let lhs: T
    
    private let rhs: ColumnVector<T>
    
    
    init(lhs: T, rhs: ColumnVector<T>) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ScalarColumnAddition {
    
    var length: Int { return rhs.length }
    
}

extension ScalarColumnAddition {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == rhs.length)
        
        for i in 0 ..< length { vector[i] = lhs + rhs[i] }
    }
    
}
