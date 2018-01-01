//
//  MatrixAddition.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct MatrixAddition<T: Numeric> {
    
    private let lhs: Matrix<T>
    
    private let rhs: Matrix<T>
    
    
    init(lhs: Matrix<T>, rhs: Matrix<T>) {
        precondition(lhs.nRows == rhs.nRows)
        precondition(lhs.nColumns == rhs.nColumns)

        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension MatrixAddition {
    
    var nRows:      Int { return lhs.nRows }
    
    var nColumns:   Int { return lhs.nColumns }

}

extension MatrixAddition {
 
    func execute(into matrix: inout Matrix<T>) {
        precondition(matrix.nRows == nRows)
        precondition(matrix.nColumns == nColumns)

        for r in 0 ..< nRows {
            for c in 0 ..< nColumns {
                matrix[row: r, column: c] = lhs[row: r, column: c] + rhs[row: r, column: c]
            }
        }
    }
    
}
