//
//  MultiplicationOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func *<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnMultiplication<T> {
    return ColumnMultiplication(lhs: lhs, rhs: rhs)
}

public func *<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowMultiplication<T> {
    return RowMultiplication(lhs: lhs, rhs: rhs)
}
