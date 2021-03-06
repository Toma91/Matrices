//
//  VectorVectorAddition.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

@_inlineable
public func +<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnVector<T> {
    precondition(lhs.length == rhs.length)
    
    let storage = Storage<T>(size: lhs.length)
    let m = lhs.length % 4

    for i in 0 ..< m {
        storage._buffer[i] = lhs._storage._buffer[i] + rhs._storage._buffer[i]
    }
    
    for i in stride(from: m, to: lhs.length, by: 4) {
        storage._buffer[i + 0] = lhs._storage._buffer[i + 0] + rhs._storage._buffer[i + 0]
        storage._buffer[i + 1] = lhs._storage._buffer[i + 1] + rhs._storage._buffer[i + 1]
        storage._buffer[i + 2] = lhs._storage._buffer[i + 2] + rhs._storage._buffer[i + 2]
        storage._buffer[i + 3] = lhs._storage._buffer[i + 3] + rhs._storage._buffer[i + 3]
    }
    
    return ColumnVector(storage: storage)
}

@_inlineable
public func +<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowVector<T> {
    precondition(lhs.length == rhs.length)
    
    let storage = Storage<T>(size: lhs.length)
    let m = lhs.length % 4
    
    for i in 0 ..< m {
        storage._buffer[i] = lhs._storage._buffer[i] + rhs._storage._buffer[i]
    }
    
    for i in stride(from: m, to: lhs.length, by: 4) {
        storage._buffer[i + 0] = lhs._storage._buffer[i + 0] + rhs._storage._buffer[i + 0]
        storage._buffer[i + 1] = lhs._storage._buffer[i + 1] + rhs._storage._buffer[i + 1]
        storage._buffer[i + 2] = lhs._storage._buffer[i + 2] + rhs._storage._buffer[i + 2]
        storage._buffer[i + 3] = lhs._storage._buffer[i + 3] + rhs._storage._buffer[i + 3]
    }
    
    return RowVector(storage: storage)
}

/*******************************************************************************
 
public func +<T>(lhs: ColumnVector<T>, rhs: T) -> ColumnVector<T> {
    let storage = Storage<T>(size: lhs.length)
    for i in 0 ..< lhs.length { storage.mutableAddress(at: i).pointee = lhs[i] + rhs }
    
    return ColumnVector(storage: storage)
}

public func +<T>(lhs: T, rhs: ColumnVector<T>) -> ColumnVector<T> {
    let storage = Storage<T>(size: rhs.length)
    for i in 0 ..< rhs.length { storage.mutableAddress(at: i).pointee = lhs + rhs[i] }
    
    return ColumnVector(storage: storage)
}


public func +<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowVector<T> {
    precondition(lhs.length == rhs.length)
    
    let storage = Storage<T>(size: lhs.length)
    for i in 0 ..< lhs.length { storage.mutableAddress(at: i).pointee = lhs[i] + rhs[i] }
    
    return RowVector(storage: storage)
}

public func +<T>(lhs: RowVector<T>, rhs: T) -> RowVector<T> {
    let storage = Storage<T>(size: lhs.length)
    for i in 0 ..< lhs.length { storage.mutableAddress(at: i).pointee = lhs[i] + rhs }
    
    return RowVector(storage: storage)
}

public func +<T>(lhs: T, rhs: RowVector<T>) -> RowVector<T> {
    let storage = Storage<T>(size: rhs.length)
    for i in 0 ..< rhs.length { storage.mutableAddress(at: i).pointee = lhs + rhs[i] }
    
    return RowVector(storage: storage)
}

*******************************************************************************/


/*public func +<T>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    precondition(lhs.nRows == rhs.nRows)
    precondition(lhs.nColumns == rhs.nColumns)

    let storage = Storage<T>(size: lhs.nRows * lhs.nColumns)

    for r in 0 ..< lhs.nRows {
        for c in 0 ..< lhs.nColumns {
            storage.mutableAddress(at: r * lhs.nColumns + c).pointee = lhs[row: r, column: c] + rhs[row: r, column: c]
        }
    }
    
    return Matrix(storage: storage, transposed: false, nRows: lhs.nRows, nColumns: lhs.nColumns)
}*/

/*public func +<T>(lhs: Matrix<T>, rhs: T) -> Matrix<T> {
    let storage = Storage<T>(size: lhs.nRows * lhs.nColumns)
    
    for r in 0 ..< lhs.nRows {
        for c in 0 ..< lhs.nColumns {
            storage.mutableAddress(at: r * lhs.nColumns + c).pointee = lhs[row: r, column: c] + rhs
        }
    }
    
    return Matrix(storage: storage, transposed: false, nRows: lhs.nRows, nColumns: lhs.nColumns)
}*/

/*public func +<T>(lhs: T, rhs: Matrix<T>) -> Matrix<T> {
    let storage = Storage<T>(size: rhs.nRows * rhs.nColumns)
    
    for r in 0 ..< rhs.nRows {
        for c in 0 ..< rhs.nColumns {
            storage.mutableAddress(at: r * rhs.nColumns + c).pointee = lhs + rhs[row: r, column: c]
        }
    }
    
    return Matrix(storage: storage, transposed: false, nRows: rhs.nRows, nColumns: rhs.nColumns)
}*/
