//
//  AdditionOperations.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func +<T>(lhs: ColumnVector<T>, rhs: ColumnVector<T>) -> ColumnAddition<T> {
    return ColumnAddition(lhs: lhs, rhs: rhs)
}

public func +<T>(lhs: RowVector<T>, rhs: RowVector<T>) -> RowAddition<T> {
    return RowAddition(lhs: lhs, rhs: rhs)
}
