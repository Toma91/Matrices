//
//  VectorVectorMultiplication.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 17/02/18.
//

@_inlineable
public func *<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnVector<T> {
    precondition(lhs.length == rhs.length)

    let storage = Storage<T>(size: lhs.length)
    let m = lhs.length % 4
    
    for i in 0 ..< m {
        storage._buffer[i] = lhs._storage._buffer[i] * rhs._storage._buffer[i]
    }
    
    for i in stride(from: m, to: lhs.length, by: 4) {
        storage._buffer[i + 0] = lhs._storage._buffer[i + 0] * rhs._storage._buffer[i + 0]
        storage._buffer[i + 1] = lhs._storage._buffer[i + 1] * rhs._storage._buffer[i + 1]
        storage._buffer[i + 2] = lhs._storage._buffer[i + 2] * rhs._storage._buffer[i + 2]
        storage._buffer[i + 3] = lhs._storage._buffer[i + 3] * rhs._storage._buffer[i + 3]
    }
    
    return ColumnVector(storage: storage)
}

@_inlineable
public func *<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowVector<T> {
    precondition(lhs.length == rhs.length)

    let storage = Storage<T>(size: lhs.length)
    let m = lhs.length % 4
    
    for i in 0 ..< m {
        storage._buffer[i] = lhs._storage._buffer[i] * rhs._storage._buffer[i]
    }
    
    for i in stride(from: m, to: lhs.length, by: 4) {
        storage._buffer[i + 0] = lhs._storage._buffer[i + 0] * rhs._storage._buffer[i + 0]
        storage._buffer[i + 1] = lhs._storage._buffer[i + 1] * rhs._storage._buffer[i + 1]
        storage._buffer[i + 2] = lhs._storage._buffer[i + 2] * rhs._storage._buffer[i + 2]
        storage._buffer[i + 3] = lhs._storage._buffer[i + 3] * rhs._storage._buffer[i + 3]
    }
    
    return RowVector(storage: storage)
}
