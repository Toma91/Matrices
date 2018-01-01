//
//  SubtractionAssignment.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ColumnSubtraction<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ScalarColumnSubtraction<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout ColumnVector<T>, rhs: ColumnScalarSubtraction<T>) {
    rhs.execute(into: &lhs)
}


public func <~<T>(lhs: inout RowVector<T>, rhs: RowSubtraction<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout RowVector<T>, rhs: ScalarRowSubtraction<T>) {
    rhs.execute(into: &lhs)
}

public func <~<T>(lhs: inout RowVector<T>, rhs: RowScalarSubtraction<T>) {
    rhs.execute(into: &lhs)
}
