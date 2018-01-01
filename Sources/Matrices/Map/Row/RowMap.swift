//
//  RowMap.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct RowMap<T: Numeric> {
    
    private let vector:     RowVector<T>
    
    private let operation:  (T) -> T
    
    
    init(vector: RowVector<T>, operation: @escaping (T) -> T) {
        self.vector     = vector
        self.operation  = operation
    }
    
}

public extension RowMap {
    
    var length: Int { return vector.length }
    
}

extension RowMap {
 
    func execute(into vector: inout RowVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = operation(self.vector[i]) }
    }
    
}
