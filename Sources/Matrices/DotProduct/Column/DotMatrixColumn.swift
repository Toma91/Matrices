//
//  DotMatrixColumn.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct DotMatrixColumn<T: Numeric> {
    
    private let lhs: Matrix<T>
    
    private let rhs: ColumnVector<T>
    
    
    init(lhs: Matrix<T>, rhs: ColumnVector<T>) {
        precondition(lhs.nColumns == rhs.length)
        
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension DotMatrixColumn {
    
    var length: Int { return lhs.nRows }
    
}

extension DotMatrixColumn {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length {
            var value: T = 0
            
            for j in 0 ..< rhs.length {
                value += lhs[row: i, column: j] * rhs[j]
            }
            
            vector[i] = value
        }
    }
    
}
