//
//  Matrix.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

// Too many ivars
//
public struct Matrix<T: Numeric> {

    @_versioned
    var _storage:           MatrixStorage<T>

    @_versioned
    let _transposed:        Bool
    
    public let nRows:       Int
    
    public let nColumns:    Int
    
    
    @_versioned @_inlineable
    init(storage: MatrixStorage<T>, transposed: Bool, nRows: Int, nColumns: Int) {
        self._storage       = storage
        self._transposed    = transposed
        self.nRows          = nRows
        self.nColumns       = nColumns
    }

}

public extension Matrix {
    
    @_inlineable
    var ᵀ: Matrix<T> {
        return Matrix(
            storage: _storage, transposed: !_transposed,
            nRows: nColumns, nColumns: nRows
        )
    }
    
}

public extension Matrix {
    
    @_inlineable
    init(nRows: Int, nColumns: Int) {
        self.init(
            storage: MatrixStorage(nRows: nRows, nColumns: nColumns), transposed: false,
            nRows: nRows, nColumns: nColumns
        )
    }

}

public extension Matrix {
    
    @_inlineable
    subscript(row row: Int, column column: Int) -> T {
        @_inlineable
        unsafeAddress {
            precondition(row.checkBounds(min: 0, max: nRows) && column.checkBounds(min: 0, max: nColumns))

            return _storage.address(at: _transposed ? (column, row) : (row, column))
        }
        @_inlineable
        unsafeMutableAddress {
            precondition(row.checkBounds(min: 0, max: nRows) && column.checkBounds(min: 0, max: nColumns))
            
            if !isKnownUniquelyReferenced(&_storage) {
                _storage = MatrixStorage(copying: _storage)
            }
            
            return _storage.mutableAddress(at: _transposed ? (column, row) : (row, column))
        }
    }
    
}
