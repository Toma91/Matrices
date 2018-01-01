//
//  FloatingPointDivisionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func /<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnFloatingPointDivision<T> {
    return ColumnFloatingPointDivision(lhs: lhs, rhs: rhs)
}

public func /<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowFloatingPointDivision<T> {
    return RowFloatingPointDivision(lhs: lhs, rhs: rhs)
}
