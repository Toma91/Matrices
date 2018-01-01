//
//  ScalarMatrixSubtraction.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ScalarMatrixSubtraction<T: Numeric> {
    
    private let lhs: T
    
    private let rhs: Matrix<T>
    
    
    init(lhs: T, rhs: Matrix<T>) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension ScalarMatrixSubtraction {
    
    var nRows:      Int { return rhs.nRows }
    
    var nColumns:   Int { return rhs.nColumns }
    
}

extension ScalarMatrixSubtraction {
 
    func execute(into matrix: inout Matrix<T>) {
        precondition(matrix.nRows == nRows)
        precondition(matrix.nColumns == nColumns)
        
        for r in 0 ..< nRows {
            for c in 0 ..< nColumns {
                matrix[row: r, column: c] = lhs - rhs[row: r, column: c]
            }
        }
    }
    
}