//
//  Matrix.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct Matrix<T: Numeric> {

    private var storage:    Storage<T>

    public let nRows:       Int
    
    public let nColumns:    Int
    
    
    init(storage: Storage<T>, nRows: Int, nColumns: Int) {
        precondition(storage.count == nRows * nColumns)
        
        self.storage    = storage
        self.nRows      = nRows
        self.nColumns   = nColumns
    }

}

public extension Matrix {
    
    var ᵀ: TransposedMatrix<T> { return TransposedMatrix(transposing: self) }
    
}

public extension Matrix {
    
    init(nRows: Int, nColumns: Int) {
        self.init(storage: Storage(size: nRows * nColumns), nRows: nRows, nColumns: nColumns)
    }

}

public extension Matrix {
    
    subscript(row row: Int, column column: Int) -> T {
        get {
            precondition(row.checkBounds(min: 0, max: nRows))
            precondition(column.checkBounds(min: 0, max: nColumns))

            return storage[row * nColumns + column]
        }
        set {
            precondition(row.checkBounds(min: 0, max: nRows))
            precondition(column.checkBounds(min: 0, max: nColumns))

            if !isKnownUniquelyReferenced(&storage) {
                storage = Storage(copying: storage)
            }
            
            return storage[row * nColumns + column] = newValue
        }
    }
    
}
