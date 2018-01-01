//
//  SubtractionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func -<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnSubtraction<T> {
    return ColumnSubtraction(lhs: lhs, rhs: rhs)
}

public func -<T>(lhs: T, rhs: ColumnVector<T>) -> ScalarColumnSubtraction<T> {
    return ScalarColumnSubtraction(lhs: lhs, rhs: rhs)
}

public func -<T>(lhs: ColumnVector<T>, rhs: T) -> ColumnScalarSubtraction<T> {
    return ColumnScalarSubtraction(lhs: lhs, rhs: rhs)
}


public func -<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowSubtraction<T> {
    return RowSubtraction(lhs: lhs, rhs: rhs)
}

public func -<T>(lhs: T, rhs: RowVector<T>) -> ScalarRowSubtraction<T> {
    return ScalarRowSubtraction(lhs: lhs, rhs: rhs)
}

public func -<T>(lhs: RowVector<T>, rhs: T) -> RowScalarSubtraction<T> {
    return RowScalarSubtraction(lhs: lhs, rhs: rhs)
}


public func -<T>(lhs: Matrix<T>, rhs: Matrix<T>) -> MatrixSubtraction<T> {
    return MatrixSubtraction(lhs: lhs, rhs: rhs)
}

public func -<T>(lhs: T, rhs: Matrix<T>) -> ScalarMatrixSubtraction<T> {
    return ScalarMatrixSubtraction(lhs: lhs, rhs: rhs)
}

public func -<T>(lhs: Matrix<T>, rhs: T) -> MatrixScalarSubtraction<T> {
    return MatrixScalarSubtraction(lhs: lhs, rhs: rhs)
}
