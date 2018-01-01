//
//  IntegerDivisionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func /<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnIntegerDivision<T> {
    return ColumnIntegerDivision(lhs: lhs, rhs: rhs)
}

public func /<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowIntegerDivision<T> {
    return RowIntegerDivision(lhs: lhs, rhs: rhs)
}
