//
//  MultiplicationOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func *<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnMultiplication<T> {
    return ColumnMultiplication(lhs: lhs, rhs: rhs)
}

public func *<T>(lhs: T, rhs: ColumnVector<T>) -> ScalarColumnMultiplication<T> {
    return ScalarColumnMultiplication(lhs: lhs, rhs: rhs)
}

public func *<T>(lhs: ColumnVector<T>, rhs: T) -> ColumnScalarMultiplication<T> {
    return ColumnScalarMultiplication(lhs: lhs, rhs: rhs)
}


public func *<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowMultiplication<T> {
    return RowMultiplication(lhs: lhs, rhs: rhs)
}

public func *<T>(lhs: T, rhs: RowVector<T>) -> ScalarRowMultiplication<T> {
    return ScalarRowMultiplication(lhs: lhs, rhs: rhs)
}

public func *<T>(lhs: RowVector<T>, rhs: T) -> RowScalarMultiplication<T> {
    return RowScalarMultiplication(lhs: lhs, rhs: rhs)
}


public func *<T>(lhs: Matrix<T>, rhs: Matrix<T>) -> MatrixMultiplication<T> {
    return MatrixMultiplication(lhs: lhs, rhs: rhs)
}

public func *<T>(lhs: T, rhs: Matrix<T>) -> ScalarMatrixMultiplication<T> {
    return ScalarMatrixMultiplication(lhs: lhs, rhs: rhs)
}

public func *<T>(lhs: Matrix<T>, rhs: T) -> MatrixScalarMultiplication<T> {
    return MatrixScalarMultiplication(lhs: lhs, rhs: rhs)
}
