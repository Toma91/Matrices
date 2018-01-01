//
//  MatrixMap.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct MatrixMap<T: Numeric> {
    
    private let matrix:     Matrix<T>
    
    private let operation:  (T) -> T
    
    
    init(matrix: Matrix<T>, operation: @escaping (T) -> T) {
        self.matrix     = matrix
        self.operation  = operation
    }
    
}

public extension MatrixMap {
    
    var nRows: Int { return matrix.nRows }

    var nColumns: Int { return matrix.nColumns }

}

extension MatrixMap {
 
    func execute(into matrix: inout Matrix<T>) {
        precondition(matrix.nRows == nRows)
        precondition(matrix.nColumns == nColumns)
        
        for r in 0 ..< nRows {
            for c in 0 ..< nColumns {
                matrix[row: r, column: c] = operation(self.matrix[row: r, column: c])
            }
        }
    }
    
}
