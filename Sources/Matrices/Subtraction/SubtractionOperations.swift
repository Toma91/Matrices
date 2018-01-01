//
//  SubtractionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func -<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnSubtraction<T> {
    return ColumnSubtraction(lhs: lhs, rhs: rhs)
}

public func -<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowSubtraction<T> {
    return RowSubtraction(lhs: lhs, rhs: rhs)
}
