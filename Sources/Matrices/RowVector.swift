//
//  RowVector.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct RowVector<T: Numeric> {

    private var storage: Storage<T>

    
    init(storage: Storage<T>) {
        self.storage = storage
    }

}

public extension RowVector {
    
    var length: Int { return storage.count }
    
    var ᵀ: ColumnVector<T> { return ColumnVector(storage: storage) }
    
}

public extension RowVector {

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

public extension RowVector {
    
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
