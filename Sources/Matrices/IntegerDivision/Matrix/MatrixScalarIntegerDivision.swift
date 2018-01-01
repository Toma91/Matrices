//
//  MatrixScalarIntegerDivision.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct MatrixScalarIntegerDivision<T: BinaryInteger> {
    
    private let lhs: Matrix<T>

    private let rhs: T
    
    
    init(lhs: Matrix<T>, rhs: T) {
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension MatrixScalarIntegerDivision {
    
    var nRows:      Int { return lhs.nRows }
    
    var nColumns:   Int { return lhs.nColumns }

}

extension MatrixScalarIntegerDivision {
 
    func execute(into matrix: inout Matrix<T>) {
        precondition(matrix.nRows == nRows)
        precondition(matrix.nColumns == nColumns)
        
        for r in 0 ..< nRows {
            for c in 0 ..< nColumns {
                matrix[row: r, column: c] = lhs[row: r, column: c] / rhs                
            }
        }
    }
    
}
