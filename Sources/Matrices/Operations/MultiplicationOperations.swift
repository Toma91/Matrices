//
//  MultiplicationOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func *<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnVector<T> {
    precondition(lhs.length == rhs.length)
    
    let storage = Storage<T>(size: lhs.length)
    for i in 0 ..< lhs.length { storage[i] = lhs[i] * rhs[i] }
    
    return ColumnVector(storage: storage)
}

public func *<T>(lhs: ColumnVector<T>, rhs: T) -> ColumnVector<T> {
    let storage = Storage<T>(size: lhs.length)
    for i in 0 ..< lhs.length { storage[i] = lhs[i] * rhs }
    
    return ColumnVector(storage: storage)
}

public func *<T>(lhs: T, rhs: ColumnVector<T>) -> ColumnVector<T> {
    let storage = Storage<T>(size: rhs.length)
    for i in 0 ..< rhs.length { storage[i] = lhs * rhs[i] }
    
    return ColumnVector(storage: storage)
}


public func *<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowVector<T> {
    precondition(lhs.length == rhs.length)
    
    let storage = Storage<T>(size: lhs.length)
    for i in 0 ..< lhs.length { storage[i] = lhs[i] * rhs[i] }
    
    return RowVector(storage: storage)
}

public func *<T>(lhs: RowVector<T>, rhs: T) -> RowVector<T> {
    let storage = Storage<T>(size: lhs.length)
    for i in 0 ..< lhs.length { storage[i] = lhs[i] * rhs }
    
    return RowVector(storage: storage)
}

public func *<T>(lhs: T, rhs: RowVector<T>) -> RowVector<T> {
    let storage = Storage<T>(size: rhs.length)
    for i in 0 ..< rhs.length { storage[i] = lhs * rhs[i] }
    
    return RowVector(storage: storage)
}


public func *<T>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    precondition(lhs.nRows == rhs.nRows)
    precondition(lhs.nColumns == rhs.nColumns)
    
    let storage = Storage<T>(size: lhs.nRows * lhs.nColumns)
    
    for r in 0 ..< lhs.nRows {
        for c in 0 ..< lhs.nColumns {
            storage[r * lhs.nColumns + c] = lhs[row: r, column: c] * rhs[row: r, column: c]
        }
    }
    
    return Matrix(storage: storage, transposed: false, nRows: lhs.nRows, nColumns: lhs.nColumns)
}

public func *<T>(lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    let storage = Storage<T>(size: lhs.nRows * lhs.nColumns)
    
    for r in 0 ..< lhs.nRows {
        for c in 0 ..< lhs.nColumns {
            storage[r * lhs.nColumns + c] = lhs[row: r, column: c] * rhs
        }
    }
    
    return Matrix(storage: storage, transposed: false, nRows: lhs.nRows, nColumns: lhs.nColumns)
}

public func *<T>(lhs: T, rhs: Matrix<T>) -> Matrix<T> {
    let storage = Storage<T>(size: rhs.nRows * rhs.nColumns)
    
    for r in 0 ..< rhs.nRows {
        for c in 0 ..< rhs.nColumns {
            storage[r * rhs.nColumns + c] = lhs * rhs[row: r, column: c]
        }
    }
    
    return Matrix(storage: storage, transposed: false, nRows: rhs.nRows, nColumns: rhs.nColumns)
}
