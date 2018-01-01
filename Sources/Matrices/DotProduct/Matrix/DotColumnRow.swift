//
//  DotColumnRow.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct DotColumnRow<T: Numeric> {
    
    private let lhs: ColumnVector<T>
    
    private let rhs: RowVector<T>
    
    
    init(lhs: ColumnVector<T>, rhs: RowVector<T>) {
        precondition(lhs.length == rhs.length)
        
        self.lhs = lhs
        self.rhs = rhs
    }
    
}

public extension DotColumnRow {
    
    var nRows:      Int { return lhs.length }
    
    var nColumns:   Int { return rhs.length }
    
}

extension DotColumnRow {
 
    func execute(into matrix: inout Matrix<T>) {
        precondition(matrix.nRows == nRows)
        precondition(matrix.nColumns == nColumns)

        for r in 0 ..< nRows {
            for c in 0 ..< nColumns {
                matrix[row: r, column: c] = lhs[r] * rhs[c]
            }
        }
    }
    
}
