//
//  RowVector.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct RowVector<T: Numeric> {

    @_versioned
    var _storage: Storage<T>

    
    @_versioned @_inlineable
    init(storage: Storage<T>) {
        self._storage = storage
    }

}

public extension RowVector {
    
    @_inlineable
    var length: Int { return _storage.count }
    
    @_inlineable
    var ᵀ: ColumnVector<T> { return ColumnVector(storage: _storage) }
    
}

public extension RowVector {

    @_inlineable
    init(length: Int) {
        self._storage = Storage(size: length)
    }
    
    @_inlineable
    init() {
        self.init(length: 0)
    }
    
    @_inlineable
    init(elements: [T]) {
        self.init(storage: Storage(elements: elements))
    }
    
    @_inlineable
    init(_ elements: T...) {
        self.init(elements: elements)
    }

}

public extension RowVector {

    @_inlineable
    subscript(index: Int) -> T {
        @_inlineable
        unsafeAddress {
            precondition(index.checkBounds(min: 0, max: length))
            
            return _storage.address(at: index)
        }
        @_inlineable
        unsafeMutableAddress {
            precondition(index.checkBounds(min: 0, max: length))

            if !isKnownUniquelyReferenced(&_storage) {
                _storage = Storage(copying: _storage)
            }
            
            return _storage.mutableAddress(at: index)
        }
    }
    
}
