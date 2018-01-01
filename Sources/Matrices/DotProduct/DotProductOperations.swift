//
//  AdditionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

infix operator •: MultiplicationPrecedence

public func •<T>(lhs: Matrix<T>, rhs: ColumnVector<T>) -> DotMatrixColumn<T> {
    return DotMatrixColumn(lhs: lhs, rhs: rhs)
}


public func •<T>(lhs: RowVector<T>, rhs: Matrix<T>) -> DotRowMatrix<T> {
    return DotRowMatrix(lhs: lhs, rhs: rhs)
}


public func •<T>(lhs: ColumnVector<T>, rhs: RowVector<T>) -> DotColumnRow<T> {
    return DotColumnRow(lhs: lhs, rhs: rhs)
}


public func •<T>(lhs: RowVector<T>, rhs: ColumnVector<T>) -> T {
    precondition(lhs.length == rhs.length)
    
    var result: T = 0
    for i in 0 ..< lhs.length { result += lhs[i] * rhs[i] }

    return result
}
