//
//  Matrix.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct Matrix<T: Numeric> {

    private var storage:    Storage<T>

    private let transposed: Bool
    
    public let nRows:       Int
    
    public let nColumns:    Int
    
    
    init(storage: Storage<T>, transposed: Bool, nRows: Int, nColumns: Int) {
        precondition(storage.count == nRows * nColumns)
        
        self.storage    = storage
        self.transposed = transposed
        self.nRows      = nRows
        self.nColumns   = nColumns
    }

}

public extension Matrix {
    
    var ᵀ: Matrix<T> {
        return Matrix(
            storage: storage, transposed: !transposed,
            nRows: nColumns, nColumns: nRows
        )
    }
    
}

public extension Matrix {
    
    init(nRows: Int, nColumns: Int) {
        self.init(
            storage: Storage(size: nRows * nColumns), transposed: false,
            nRows: nRows, nColumns: nColumns
        )
    }

}

public extension Matrix {
    
    subscript(row row: Int, column column: Int) -> T {
        get {
            precondition(row.checkBounds(min: 0, max: nRows))
            precondition(column.checkBounds(min: 0, max: nColumns))

            let index = transposed
                ? column * nRows + row
                : row * nColumns + column
            
            return storage.address(at: index).pointee
        }
        set {
            precondition(row.checkBounds(min: 0, max: nRows))
            precondition(column.checkBounds(min: 0, max: nColumns))

            if !isKnownUniquelyReferenced(&storage) {
                storage = Storage(copying: storage)
            }
            
            let index = transposed
                ? column * nRows + row
                : row * nColumns + column
            
            storage.mutableAddress(at: index).pointee = newValue
        }
    }
    
}
