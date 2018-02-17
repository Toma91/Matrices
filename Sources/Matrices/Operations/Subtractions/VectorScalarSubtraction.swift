//
//  VectorScalarSubtraction.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

@_inlineable
public func -<T>(lhs: ColumnVector<T>, rhs: T) -> ColumnVector<T> {
    let storage = Storage<T>(size: lhs.length)
    let m = lhs.length % 4

    for i in 0 ..< m {
        storage._buffer[i] = lhs._storage._buffer[i] - rhs
    }
    
    for i in stride(from: m, to: lhs.length, by: 4) {
        storage._buffer[i + 0] = lhs._storage._buffer[i + 0] - rhs
        storage._buffer[i + 1] = lhs._storage._buffer[i + 1] - rhs
        storage._buffer[i + 2] = lhs._storage._buffer[i + 2] - rhs
        storage._buffer[i + 3] = lhs._storage._buffer[i + 3] - rhs
    }
    
    return ColumnVector(storage: storage)
}

@_inlineable
public func -<T>(lhs: RowVector<T>, rhs: T) -> RowVector<T> {
    let storage = Storage<T>(size: lhs.length)
    let m = lhs.length % 4
    
    for i in 0 ..< m {
        storage._buffer[i] = lhs._storage._buffer[i] - rhs
    }
    
    for i in stride(from: m, to: lhs.length, by: 4) {
        storage._buffer[i + 0] = lhs._storage._buffer[i + 0] - rhs
        storage._buffer[i + 1] = lhs._storage._buffer[i + 1] - rhs
        storage._buffer[i + 2] = lhs._storage._buffer[i + 2] - rhs
        storage._buffer[i + 3] = lhs._storage._buffer[i + 3] - rhs
    }
    
    return RowVector(storage: storage)
}
