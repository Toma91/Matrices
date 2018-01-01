//
//  ScalarColumnSubtraction.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ScalarColumnSubtraction<T: Numeric> {
    
    private let lhs: T
    
    private let rhs: ColumnVector<T>
    
    
    init(lhs: T, rhs: ColumnVector<T>) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ScalarColumnSubtraction {
    
    var length: Int { return rhs.length }
    
}

extension ScalarColumnSubtraction {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == rhs.length)
        
        for i in 0 ..< length { vector[i] = lhs - rhs[i] }
    }
    
}
