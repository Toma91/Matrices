//
//  ColumnMap.swift
//  Matrices
//
//  Created by Andrea Tomarelli on 01/01/18.
//

public struct ColumnMap<T: Numeric> {
    
    private let vector:     ColumnVector<T>
    
    private let operation:  (T) -> T
    
    
    init(vector: ColumnVector<T>, operation: @escaping (T) -> T) {
        self.vector     = vector
        self.operation  = operation
    }
    
}

public extension ColumnMap {
    
    var length: Int { return vector.length }
    
}

extension ColumnMap {
 
    func execute(into vector: inout ColumnVector<T>) {
        precondition(vector.length == length)
        
        for i in 0 ..< length { vector[i] = operation(self.vector[i]) }
    }
    
}
