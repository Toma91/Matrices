//
//  FloatingPointDivisionAssignment.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ColumnFloatingPointDivision<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ScalarColumnFloatingPointDivision<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ColumnScalarFloatingPointDivision<T>) {
    rhs.execute(into: &lhs)
}


public func <~<T>(lhs: inout RowVector<T>, rhs: RowFloatingPointDivision<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout RowVector<T>, rhs: ScalarRowFloatingPointDivision<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout RowVector<T>, rhs: RowScalarFloatingPointDivision<T>) {
    rhs.execute(into: &lhs)
}
