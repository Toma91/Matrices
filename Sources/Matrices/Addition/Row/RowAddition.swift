//
//  RowAddition.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct RowAddition<T: Numeric> {
    
    private let lhs: RowVector<T>
    
    private let rhs: RowVector<T>
    
    
    init(lhs: RowVector<T>, rhs: RowVector<T>) {
        precondition(lhs.length == rhs.length)
        
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension RowAddition {
    
    var length: Int { return lhs.length }
    
}

extension RowAddition {
 
    func execute(into vector: inout RowVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = lhs[i] + rhs[i] }
    }
    
}
