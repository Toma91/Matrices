//
//  AdditionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

infix operator •: MultiplicationPrecedence

/*public func •<T>(lhs: Matrix<T>, rhs: ColumnVector<T>) -> ColumnVector<T> {
    precondition(lhs.nColumns == rhs.length)

    let storage = Storage<T>(size: lhs.nRows)
    
    for i in 0 ..< lhs.nRows {
        var value: T = 0
        
        for j in 0 ..< lhs.nColumns {
            value += lhs[row: i, column: j] * rhs[j]
        }
        
        storage.mutableAddress(at: i).pointee = value
    }
    
    return ColumnVector(storage: storage)
}*/


/*public func •<T>(lhs: RowVector<T>, rhs: Matrix<T>) -> RowVector<T> {
    precondition(lhs.length == rhs.nRows)
    
    let storage = Storage<T>(size: rhs.nColumns)
    
    
    for i in 0 ..< rhs.nColumns {
        var value: T = 0
        
        for j in 0 ..< rhs.nRows {
            value += lhs[j] * rhs[row: j, column: i]
        }
        
        storage.mutableAddress(at: i).pointee = value
    }
    
    return RowVector(storage: storage)
}*/


/*public func •<T>(lhs: ColumnVector<T>, rhs: RowVector<T>) -> Matrix<T> {
    let storage = Storage<T>(size: lhs.length * rhs.length)
    
    for r in 0 ..< rhs.length {
        for c in 0 ..< lhs.length {
            storage.mutableAddress(at: r * lhs.length + c).pointee = lhs[r] * rhs[c]
        }
    }
    
    return Matrix(storage: storage, transposed: false, nRows: rhs.length, nColumns: lhs.length)
}*/

@_inlineable
public func •<T>(lhs: RowVector<T>, rhs: ColumnVector<T>) -> T {
    precondition(lhs.length == rhs.length)
    
    var result: T = 0
    //for i in 0 ..< lhs.length { result += lhs[i] * rhs[i] }
    /*for i in 0 ..< lhs.length {
        result += lhs._storage.address(at: i).pointee * rhs._storage.address(at: i).pointee
    }*/
    
    let m = lhs.length % 4
    
    for i in 0 ..< m {
        result += lhs._storage.address(at: i).pointee * rhs._storage.address(at: i).pointee
    }
    
    for i in stride(from: m, to: lhs.length, by: 4) {
        result += lhs._storage.address(at: i + 0).pointee * rhs._storage.address(at: i + 0).pointee
        result += lhs._storage.address(at: i + 1).pointee * rhs._storage.address(at: i + 1).pointee
        result += lhs._storage.address(at: i + 2).pointee * rhs._storage.address(at: i + 2).pointee
        result += lhs._storage.address(at: i + 3).pointee * rhs._storage.address(at: i + 3).pointee
    }
    
    return result
}
