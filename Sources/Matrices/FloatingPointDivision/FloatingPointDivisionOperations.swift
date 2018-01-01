//
//  FloatingPointDivisionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func /<T: FloatingPoint>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnFloatingPointDivision<T> {
    return ColumnFloatingPointDivision(lhs: lhs, rhs: rhs)
}

public func /<T: FloatingPoint>(lhs: T, rhs: ColumnVector<T>) -> ScalarColumnFloatingPointDivision<T> {
    return ScalarColumnFloatingPointDivision(lhs: lhs, rhs: rhs)
}

public func /<T: FloatingPoint>(lhs: ColumnVector<T>, rhs: T) -> ColumnScalarFloatingPointDivision<T> {
    return ColumnScalarFloatingPointDivision(lhs: lhs, rhs: rhs)
}


public func /<T: FloatingPoint>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowFloatingPointDivision<T> {
    return RowFloatingPointDivision(lhs: lhs, rhs: rhs)
}

public func /<T: FloatingPoint>(lhs: T, rhs: RowVector<T>) -> ScalarRowFloatingPointDivision<T> {
    return ScalarRowFloatingPointDivision(lhs: lhs, rhs: rhs)
}

public func /<T: FloatingPoint>(lhs: RowVector<T>, rhs: T) -> RowScalarFloatingPointDivision<T> {
    return RowScalarFloatingPointDivision(lhs: lhs, rhs: rhs)
}
