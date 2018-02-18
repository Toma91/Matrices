//
//  MatrixStorage.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 17/02/18.
//

import Darwin.C

@_versioned
final class MatrixStorage<T: Numeric> {
    
    @_versioned
    let _buffer: UnsafeMutablePointer<T>
    
    @_versioned
    let _nRows: Int
    
    @_versioned
    let _nColumns: Int

    
    @_versioned @_inlineable
    init(nRows: Int, nColumns: Int) {
        self._buffer    = .allocate(capacity: nRows * nColumns)
        self._nRows     = nRows
        self._nColumns  = nColumns
    }
    
    deinit {
        _buffer.deallocate(capacity: _nRows * _nColumns)
    }
    
}

extension MatrixStorage {
    
    @_versioned @_inlineable
    convenience init(copying other: MatrixStorage<T>) {
        self.init(nRows: other._nRows, nColumns: other._nColumns)
        
        memcpy(_buffer, other._buffer, _nRows * _nColumns)
    }
    
}
extension MatrixStorage {

    typealias Index = (row: Int, column: Int)
    
    @_versioned @_inlineable
    func address(at index: Index) -> UnsafePointer<T> {
        return UnsafePointer(_buffer.advanced(by: index.row * _nColumns + index.column))
    }
    
    @_versioned @_inlineable
    func mutableAddress(at index: Index) -> UnsafeMutablePointer<T> {
        return _buffer.advanced(by: index.row * _nColumns + index.column)
    }

}
