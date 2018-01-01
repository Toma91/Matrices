//
//  AdditionAssignment.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ColumnAddition<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ScalarColumnAddition<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ColumnScalarAddition<T>) {
    rhs.execute(into: &lhs)
}


public func <~<T>(lhs: inout RowVector<T>, rhs: RowAddition<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout RowVector<T>, rhs: ScalarRowAddition<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout RowVector<T>, rhs: RowScalarAddition<T>) {
    rhs.execute(into: &lhs)
}


public func <~<T>(lhs: inout Matrix<T>, rhs: MatrixAddition<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout Matrix<T>, rhs: ScalarMatrixAddition<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout Matrix<T>, rhs: MatrixScalarAddition<T>) {
    rhs.execute(into: &lhs)
}
