//
//  IntegerDivisionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func /<T: BinaryInteger>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnIntegerDivision<T> {
    return ColumnIntegerDivision(lhs: lhs, rhs: rhs)
}

public func /<T: BinaryInteger>(lhs: T, rhs: ColumnVector<T>) -> ScalarColumnIntegerDivision<T> {
    return ScalarColumnIntegerDivision(lhs: lhs, rhs: rhs)
}

public func /<T: BinaryInteger>(lhs: ColumnVector<T>, rhs: T) -> ColumnScalarIntegerDivision<T> {
    return ColumnScalarIntegerDivision(lhs: lhs, rhs: rhs)
}


public func /<T: BinaryInteger>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowIntegerDivision<T> {
    return RowIntegerDivision(lhs: lhs, rhs: rhs)
}

public func /<T: BinaryInteger>(lhs: T, rhs: RowVector<T>) -> ScalarRowIntegerDivision<T> {
    return ScalarRowIntegerDivision(lhs: lhs, rhs: rhs)
}

public func /<T: BinaryInteger>(lhs: RowVector<T>, rhs: T) -> RowScalarIntegerDivision<T> {
    return RowScalarIntegerDivision(lhs: lhs, rhs: rhs)
}
