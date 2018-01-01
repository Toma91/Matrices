//
//  AdditionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

infix operator •: MultiplicationPrecedence

public func •<T>(lhs: Matrix<T>, rhs: ColumnVector<T>) -> ColumnVector<T> {
    precondition(lhs.nColumns == rhs.length)

    let storage = Storage<T>(size: lhs.nRows)
    
    for i in 0 ..< lhs.nRows {
        var value: T = 0
        
        for j in 0 ..< lhs.nColumns {
            value += lhs[row: i, column: j] * rhs[j]
        }
        
        storage[i] = value
    }
    
    return ColumnVector(storage: storage)
}


public func •<T>(lhs: RowVector<T>, rhs: Matrix<T>) -> RowVector<T> {
    precondition(lhs.length == rhs.nRows)
    
    let storage = Storage<T>(size: rhs.nColumns)
    
    
    for i in 0 ..< rhs.nColumns {
        var value: T = 0
        
        for j in 0 ..< rhs.nRows {
            value += lhs[j] * rhs[row: j, column: i]
        }
        
        storage[i] = value
    }
    
    return RowVector(storage: storage)
}


public func •<T>(lhs: ColumnVector<T>, rhs: RowVector<T>) -> Matrix<T> {
    let storage = Storage<T>(size: lhs.length * rhs.length)
    
    for r in 0 ..< rhs.length {
        for c in 0 ..< lhs.length {
            storage[r * lhs.length + c] = lhs[r] * rhs[c]
        }
    }
    
    return Matrix(storage: storage, transposed: false, nRows: rhs.length, nColumns: lhs.length)
}


public func •<T>(lhs: RowVector<T>, rhs: ColumnVector<T>) -> T {
    precondition(lhs.length == rhs.length)
    
    var result: T = 0
    for i in 0 ..< lhs.length { result += lhs[i] * rhs[i] }

    return result
}
