//
//  Storage.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 31/12/17.
//

class Storage<T: Numeric> {
    
    private let buffer: UnsafeMutableBufferPointer<T>
    
    
    init(size: Int) {
        self.buffer = UnsafeMutableBufferPointer(
            start: .allocate(capacity: size),
            count: size
        )
    }
    
    deinit {
        buffer.baseAddress!.deinitialize(count: buffer.count)
    }
    
}

extension Storage {
    
    var count: Int { return buffer.count }
    
}

extension Storage {
    
    convenience init(copying other: Storage<T>) {
        self.init(size: other.count)
        
        buffer.baseAddress!.initialize(
            from: other.buffer.baseAddress!,
            count: count
        )
    }
    
    convenience init(elements: [T]) {
        self.init(size: elements.count)
    
        buffer.baseAddress!.initialize(from: elements, count: count)
    }
    
}

extension Storage {
    
    subscript(index: Int) -> T {
        @inline(__always) get { return buffer[index] }
        @inline(__always) set { buffer[index] = newValue }
    }
    
}
