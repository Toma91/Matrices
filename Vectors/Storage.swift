//
//  Storage.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 31/12/17.
//

import Darwin.C

@_versioned
final class Storage<T: Numeric> {
    
    @_versioned
    let _buffer: UnsafeMutablePointer<T>
    
    @_versioned
    let count: Int
    
    
    @_versioned @_inlineable
    init(size: Int) {
        self._buffer = .allocate(capacity: size)
        self.count = size
    }
    
    deinit {
        _buffer.deallocate(capacity: count)
    }
    
}

extension Storage {
    
    @_versioned @_inlineable
    convenience init(copying other: Storage<T>) {
        self.init(size: other.count)
        
        memcpy(_buffer, other._buffer, count)
    }
    
    @_versioned @_inlineable
    convenience init(elements: [T]) {
        self.init(size: elements.count)
    
        elements.withUnsafeBytes { (bytes) -> Void in
            memcpy(_buffer, bytes.baseAddress!, MemoryLayout<T>.size * count)
        }
    }
    
}

extension Storage {

    @_versioned @_inlineable
    func address(at index: Int) -> UnsafePointer<T> {
        return UnsafePointer(_buffer.advanced(by: index))
    }
    
    @_versioned @_inlineable
    func mutableAddress(at index: Int) -> UnsafeMutablePointer<T> {
        return _buffer.advanced(by: index)
    }
    
}
