//
//  TransposedMatrix.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct TransposedMatrix<T: Numeric> {

    private var matrix: Matrix<T>
    
    
    init(transposing matrix: Matrix<T>) {
        self.matrix = matrix
    }

}

public extension TransposedMatrix {
    
    var nRows:      Int { return matrix.nColumns }
    
    var nColumns:   Int { return matrix.nRows }
    
    var ᵀ:          Matrix<T> { return matrix }
    
}

public extension TransposedMatrix {
    
    subscript(row row: Int, column column: Int) -> T {
        get { return matrix[row: column, column: row] }
        set { matrix[row: column, column: row] = newValue }
    }
    
}
