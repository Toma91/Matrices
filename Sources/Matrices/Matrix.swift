//
//  Matrix.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct Matrix<T: Numeric> {

    @_versioned
    var _storage:           Storage<T>

    @_versioned
    let _transposed:        Bool
    
    public let nRows:       Int
    
    public let nColumns:    Int
    
    
    @_versioned @_inlineable
    init(storage: Storage<T>, transposed: Bool, nRows: Int, nColumns: Int) {
        precondition(storage.count == nRows * nColumns)
        
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
            storage: Storage(size: nRows * nColumns), transposed: false,
            nRows: nRows, nColumns: nColumns
        )
    }

}

public extension Matrix {
    
    @_inlineable
    subscript(row row: Int, column column: Int) -> T {
        @_inlineable
        get {
            precondition(row.checkBounds(min: 0, max: nRows))
            precondition(column.checkBounds(min: 0, max: nColumns))

            let index = _transposed
                ? column * nRows + row
                : row * nColumns + column
            
            return _storage.address(at: index).pointee
        }
        @_inlineable
        set {
            precondition(row.checkBounds(min: 0, max: nRows))
            precondition(column.checkBounds(min: 0, max: nColumns))

            if !isKnownUniquelyReferenced(&_storage) {
                _storage = Storage(copying: _storage)
            }
            
            let index = _transposed
                ? column * nRows + row
                : row * nColumns + column
            
            _storage.mutableAddress(at: index).pointee = newValue
        }
    }
    
}
