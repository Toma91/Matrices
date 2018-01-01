//
//  ColumnFloatingPointDivision.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ColumnFloatingPointDivision<T: FloatingPoint> {
    
    private let lhs: ColumnVector<T>
    
    private let rhs: ColumnVector<T>
    
    
    init(lhs: ColumnVector<T>, rhs: ColumnVector<T>) {
        precondition(lhs.length == rhs.length)
        
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ColumnFloatingPointDivision {
    
    var length: Int { return lhs.length }
    
}

extension ColumnFloatingPointDivision {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == lhs.length)
        
        for i in 0 ..< length { vector[i] = lhs[i] / rhs[i] }
    }
    
}
