//
//  Storage.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 31/12/17.
//

import Darwin.C

@_versioned
class Storage<T: Numeric> {
    
    /*@_versioned
    let _buffer: Int
    
    @_versioned
    let count:  Int*/
    
    @_versioned
    let _buffer: UnsafeMutablePointer<T>
    
    @_versioned
    let count: Int
    
    
    @_versioned @_inlineable
    init(size: Int) {
        self._buffer = UnsafeMutablePointer.allocate(capacity: size)
        self.count = size
        
        //self._buffer    = unsafeBitCast(malloc(MemoryLayout<T>.size * size), to: Int.self)
        //self.count      = size
    }
    
    deinit {
        //free(UnsafeMutableRawPointer(bitPattern: _buffer))
        _buffer.deallocate(capacity: count)
    }
    
}

extension Storage {
    
    @_versioned @_inlineable
    convenience init(copying other: Storage<T>) {
        self.init(size: other.count)
        
        memcpy(
            //UnsafeMutableRawPointer(bitPattern: _buffer),
            //UnsafeRawPointer(bitPattern: other._buffer),
            _buffer,
            other._buffer,
            MemoryLayout<T>.size * count
        )
    }
    
    @_versioned @_inlineable
    convenience init(elements: [T]) {
        self.init(size: elements.count)
    
        elements.withUnsafeBytes { (bytes) -> Void in
            memcpy(
                //UnsafeMutableRawPointer(bitPattern: _buffer),
                _buffer,
                bytes.baseAddress!,
                MemoryLayout<T>.size * count
            )
        }
    }
    
}

extension Storage {

    @_versioned @_inlineable
    func address(at index: Int) -> UnsafePointer<T> {
        //return UnsafePointer(bitPattern: _buffer + MemoryLayout<T>.size * index)!
        return UnsafePointer(_buffer).advanced(by: index)
    }
    
    @_versioned @_inlineable
    func mutableAddress(at index: Int) -> UnsafeMutablePointer<T> {
        //return UnsafeMutablePointer(bitPattern: _buffer + MemoryLayout<T>.size * index)!
        return _buffer.advanced(by: index)
    }
    
}
