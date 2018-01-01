//
//  ColumnVector.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 31/12/17.
//

public struct ColumnVector<T: Numeric> {

    private var storage: Storage<T>

    
    init(storage: Storage<T>) {
        self.storage = storage
    }

}

public extension ColumnVector {
    
    var length: Int { return storage.count }
    
    var ᵀ: RowVector<T> { return RowVector(storage: storage) }

}

public extension ColumnVector {

    init(length: Int) {
        self.storage = Storage(size: length)
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
    
    subscript(index: Int) -> T {
        get {
            precondition(index.checkBounds(min: 0, max: length))
            
            return storage[index]
        }
        set {
            precondition(index.checkBounds(min: 0, max: length))

            if !isKnownUniquelyReferenced(&storage) {
                storage = Storage(copying: storage)
            }
            
            storage[index] = newValue
        }
    }
    
}
