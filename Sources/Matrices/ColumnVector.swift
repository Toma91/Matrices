//
//  ColumnVector.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 31/12/17.
//

public struct ColumnVector<T: Numeric> {

    @_versioned
    var _storage: Storage<T>

    
    init(storage: Storage<T>) {
        self._storage = storage
    }

}

public extension ColumnVector {
    
    @_inlineable
    var length: Int { return _storage.count }
    
    var ᵀ: RowVector<T> { return RowVector(storage: _storage) }

}

public extension ColumnVector {

    init(length: Int) {
        self._storage = Storage(size: length)
    }
    
    init() {
        self.init(length: 0)
    }
    
    init(elements: [T]) {
        self.init(storage: Storage(elements: elements))
    }
    
    init(_ elements: T...) {
        self.init(elements: elements)
    }

}

public extension ColumnVector {
    
    @_inlineable
    subscript(index: Int) -> T {
        unsafeAddress {
            precondition(index.checkBounds(min: 0, max: length))
            
            return _storage.address(at: index)
        }
        unsafeMutableAddress {
            precondition(index.checkBounds(min: 0, max: length))
            
            if !isKnownUniquelyReferenced(&_storage) {
                _storage = Storage(copying: _storage)
            }
            
            return _storage.mutableAddress(at: index)
        }
    }
    
}
