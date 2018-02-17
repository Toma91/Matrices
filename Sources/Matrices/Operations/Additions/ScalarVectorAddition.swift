//
//  ScalarVectorAddition.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

@_inlineable
public func +<T>(lhs: T, rhs: ColumnVector<T>) -> ColumnVector<T> {
    let storage = Storage<T>(size: rhs.length)
    let m = rhs.length % 4
    
    for i in 0 ..< m {
        storage._buffer[i] = lhs + rhs._storage._buffer[i]
    }
    
    for i in stride(from: m, to: rhs.length, by: 4) {
        storage._buffer[i + 0] = lhs + rhs._storage._buffer[i + 0]
        storage._buffer[i + 1] = lhs + rhs._storage._buffer[i + 1]
        storage._buffer[i + 2] = lhs + rhs._storage._buffer[i + 2]
        storage._buffer[i + 3] = lhs + rhs._storage._buffer[i + 3]
    }
    
    return ColumnVector(storage: storage)
}

@_inlineable
public func +<T>(lhs: T, rhs: RowVector<T>) -> RowVector<T> {
    let storage = Storage<T>(size: rhs.length)
    let m = rhs.length % 4
    
    for i in 0 ..< m {
        storage._buffer[i] = lhs + rhs._storage._buffer[i]
    }
    
    for i in stride(from: m, to: rhs.length, by: 4) {
        storage._buffer[i + 0] = lhs + rhs._storage._buffer[i + 0]
        storage._buffer[i + 1] = lhs + rhs._storage._buffer[i + 1]
        storage._buffer[i + 2] = lhs + rhs._storage._buffer[i + 2]
        storage._buffer[i + 3] = lhs + rhs._storage._buffer[i + 3]
    }
    
    return RowVector(storage: storage)
}
