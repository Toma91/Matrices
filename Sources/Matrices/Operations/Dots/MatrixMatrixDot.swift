//
//  MatrixMatrixDot.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 17/02/18.
//

import Darwin.C

@_versioned @_inlineable
func _matrix_add<T: Numeric>(_ n: Int, _ X: [[T]], _ Y: [[T]], _ Z: inout [[T]]) {
    var i = 0
    var j = 0
    
    while i < n {
        j = 0
        while j < n {
            Z[i][j] = X[i][j] + Y[i][j]
            j += 1
        }
        i += 1
    }
}

@_versioned @_inlineable
func _matrix_sub<T: Numeric>(_ n: Int, _ X: [[T]], _ Y: [[T]], _ Z: inout [[T]]) {
    var i = 0
    var j = 0
    
    while i < n {
        j = 0
        while j < n {
            Z[i][j] = X[i][j] - Y[i][j]
            j += 1
        }
        i += 1
    }
}

@_versioned @_inlineable
func _matrix_multiply<T: Numeric>(_ A: [[T]], _ B: [[T]], _ C: inout [[T]]) {
    var i = 0
    var j = 0
    var t = 0
    
    while i < 2 {
        j = 0
        while j < 2 {
            t = 0
            C[i][j] = 0
            while t < 2 {
                C[i][j] = C[i][j] + A[i][t] * B[t][j];
                t += 1
            }
            j += 1
        }
        i += 1
    }
}

@_versioned @_inlineable
func _strassen<T: Numeric>(_ n: Int, _ A: [[T]], _ B: [[T]], _ C: inout [[T]]) {
    guard n > 2 else { return _matrix_multiply(A, B, &C) }
    
    var A11: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var A12: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var A21: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var A22: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var AA: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    var B11: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var B12: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var B21: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var B22: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var BB: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    var C11: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var C12: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var C21: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var C22: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    var M1: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var M2: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var M3: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var M4: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var M5: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var M6: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var M7: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    var i = 0
    var j = 0
    
    while i < n/2 {
        j = 0
        while j < n/2 {
            A11[i][j] = A[i][j]
            A12[i][j] = A[i][j + n/2]
            A21[i][j] = A[i + n/2][j]
            A22[i][j] = A[i + n/2][j + n/2]
            
            B11[i][j] = B[i][j]
            B12[i][j] = B[i][j + n/2]
            B21[i][j] = B[i + n/2][j]
            B22[i][j] = B[i + n/2][j + n/2]
            
            j += 1
        }
        i += 1
    }
    
    _matrix_add(n/2, A11, A22, &AA)
    _matrix_add(n/2, B11, B22, &BB)
    _strassen(n/2, AA, BB, &M1)
    
    _matrix_add(n/2, A21, A22, &AA)
    _strassen(n/2, AA, B11, &M2)
    
    _matrix_sub(n/2, B12, B22, &BB)
    _strassen(n/2, A22, BB, &M3)
    
    _matrix_sub(n/2, B21, B11, &BB)
    _strassen(n/2, A22, BB, &M4)
    
    _matrix_add(n/2, A11, A12, &AA)
    _strassen(n/2, AA, B22, &M5)
    
    _matrix_sub(n/2, A21, A11, &AA)
    _matrix_add(n/2, B11, B12, &BB)
    _strassen(n/2, AA, BB, &M6)
    
    _matrix_sub(n/2, A12, A22, &AA)
    _matrix_add(n/2, B21, B22, &BB)
    _strassen(n/2, AA, BB, &M7)
    
    _matrix_add(n/2, M1, M3, &AA)
    _matrix_sub(n/2, M7, M5, &BB)
    _matrix_add(n/2, AA, BB, &C11)
    
    _matrix_add(n/2, M3, M5, &C12)
    
    _matrix_add(n/2, M2, M4, &C21)
    
    _matrix_sub(n/2, M1, M2, &AA)
    _matrix_add(n/2, M3, M6, &BB)
    _matrix_add(n/2, AA, BB, &C22)
    
    i = 0
    j = 0
    
    while i < n/2 {
        j = 0
        while j < n/2 {
            C[i][j] = C11[i][j]
            C[i][j + n/2] = C21[i][j]
            C[i + n/2][j] = C12[i][j]
            C[i + n/2][j + n/2] = C22[i][j]
            
            j += 1
        }
        i += 1
    }
}

@_inlineable
public func •<T>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T> {
    precondition(lhs.nColumns == rhs.nRows)

    let n = Int(pow(2, ceil(log2(Double(max(lhs.nRows, lhs.nColumns, rhs.nRows, rhs.nColumns))))))
    
    let A: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    let B: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var C: [[T]] = Array(repeating: Array(repeating: 0, count: n), count: n)

    _strassen(n, A, B, &C)
    
    let storage = C.withUnsafeBufferPointer { (buffer) -> MatrixStorage<T> in
        let storage = MatrixStorage<T>(nRows: lhs.nRows, nColumns: rhs.nColumns)
        
        for i in 0 ..< lhs.nRows {
            for j in 0 ..< rhs.nColumns {
                storage._buffer[i * rhs.nColumns + j] = buffer[i][j]
            }
        }
        
        return storage
    }
    
    return Matrix(storage: storage, transposed: false, nRows: lhs.nRows, nColumns: rhs.nColumns)
}

