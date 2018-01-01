//
//  AdditionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func +<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnAddition<T> {
    return ColumnAddition(lhs: lhs, rhs: rhs)
}

public func +<T>(lhs: T, rhs: ColumnVector<T>) -> ScalarColumnAddition<T> {
    return ScalarColumnAddition(lhs: lhs, rhs: rhs)
}

public func +<T>(lhs: ColumnVector<T>, rhs: T) -> ColumnScalarAddition<T> {
    return ColumnScalarAddition(lhs: lhs, rhs: rhs)
}


public func +<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowAddition<T> {
    return RowAddition(lhs: lhs, rhs: rhs)
}

public func +<T>(lhs: T, rhs: RowVector<T>) -> ScalarRowAddition<T> {
    return ScalarRowAddition(lhs: lhs, rhs: rhs)
}

public func +<T>(lhs: RowVector<T>, rhs: T) -> RowScalarAddition<T> {
    return RowScalarAddition(lhs: lhs, rhs: rhs)
}


public func +<T>(lhs: Matrix<T>, rhs: Matrix<T>) -> MatrixAddition<T> {
    return MatrixAddition(lhs: lhs, rhs: rhs)
}

public func +<T>(lhs: T, rhs: Matrix<T>) -> ScalarMatrixAddition<T> {
    return ScalarMatrixAddition(lhs: lhs, rhs: rhs)
}

public func +<T>(lhs: Matrix<T>, rhs: T) -> MatrixScalarAddition<T> {
    return MatrixScalarAddition(lhs: lhs, rhs: rhs)
}
