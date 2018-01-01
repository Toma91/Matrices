//
//  MultiplicationAssignment.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ColumnMultiplication<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout RowVector<T>, rhs: RowMultiplication<T>) {
    rhs.execute(into: &lhs)
}
