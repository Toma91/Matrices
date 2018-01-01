//
//  MapAssignment.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ColumnMap<T>) {
    rhs.execute(into: &lhs)
}


public func <~<T>(lhs: inout RowVector<T>, rhs: RowMap<T>) {
    rhs.execute(into: &lhs)
}


public func <~<T>(lhs: inout Matrix<T>, rhs: MatrixMap<T>) {
    rhs.execute(into: &lhs)
}
