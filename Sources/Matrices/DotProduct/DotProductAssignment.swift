//
//  AdditionAssignment.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func <~<T>(lhs: inout ColumnVector<T>, rhs: DotMatrixColumn<T>) {
    rhs.execute(into: &lhs)
}


public func <~<T>(lhs: inout RowVector<T>, rhs: DotRowMatrix<T>) {
    rhs.execute(into: &lhs)
}


public func <~<T>(lhs: inout Matrix<T>, rhs: DotColumnRow<T>) {
    rhs.execute(into: &lhs)
}
