//
//  DotRowMatrix.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct DotRowMatrix<T: Numeric> {
    
    private let lhs: RowVector<T>
    
    private let rhs: Matrix<T>
    
    
    init(lhs: RowVector<T>, rhs: Matrix<T>) {
        precondition(lhs.length == rhs.nRows)
        
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension DotRowMatrix {
    
    var length: Int { return rhs.nColumns }
    
}

extension DotRowMatrix {
 
    func execute(into vector: inout RowVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length {
            var value: T = 0
            
            for j in 0 ..< lhs.length {
                value += lhs[j] * rhs[row: j, column: i]
            }
            
            vector[i] = value
        }
    }
    
}
