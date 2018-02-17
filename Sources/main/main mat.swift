import Accelerate
import Foundation
import Matrices

@inline(never)
func test_a() -> Double {
    /*let ptr1 = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 24)
    let ptr2 = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 24)
    var result = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 24)

    defer { ptr1.deallocate(capacity: 1 << 24) }
    defer { ptr2.deallocate(capacity: 1 << 24) }
    defer { result.deallocate(capacity: 1 << 24) }*/
    
    let ptr1: [[Float]] = Array(repeating: Array(repeating: 0, count: 1 << 12), count: 1 << 12)
    let ptr2: [[Float]] = Array(repeating: Array(repeating: 0, count: 1 << 12), count: 1 << 12)
    var result: [[Float]] = Array(repeating: Array(repeating: 0, count: 1 << 12), count: 1 << 12)

    /*
    var r = 0
    var c = 0
    var i = 0
    var partial: Float = 0
     */
    
    let d1 = Date()
    //
    // ---------------------------------------------------------------  Strassen
    //
    let N = 1 << 12
    func matrix_add(_ n: Int, _ X: [[Float]], _ Y: [[Float]], _ Z: inout [[Float]]) {
        var i = 0
        var j = 0
        
        while i < n {
            j = 0
            while j < n {
                Z[i][j] = X[i][j] + Y[i][j]
                j += 1
            }
            i += 1
        }
    }
    func matrix_sub(_ n: Int, _ X: [[Float]], _ Y: [[Float]], _ Z: inout [[Float]]) {
        var i = 0
        var j = 0
        
        while i < n {
            j = 0
            while j < n {
                Z[i][j] = X[i][j] - Y[i][j]
                j += 1
            }
            i += 1
        }
    }
    func matrix_multiply(_ A: [[Float]], _ B: [[Float]], _ C: inout [[Float]]) {
        var i = 0
        var j = 0
        var t = 0
        
        while i < 2 {
            j = 0
            while j < 2 {
                t = 0
                C[i][j] = 0;
                while t < 2 {
                    C[i][j] = C[i][j] + A[i][t] * B[t][j];
                    t += 1
                }
                
                j += 1
            }
            i += 1
        }
    }
    func strassen(_ n: Int, _ A: [[Float]], _ B: [[Float]], _ C: inout [[Float]]) {
        guard n > 2 else { return matrix_multiply(A, B, &C) }
        
        var A11: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var A12: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var A21: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var A22: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var AA: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        
        var B11: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var B12: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var B21: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var B22: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var BB: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        
        var C11: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var C12: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var C21: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var C22: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        
        var M1: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var M2: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var M3: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var M4: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var M5: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var M6: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)
        var M7: [[Float]] = Array(repeating: Array(repeating: 0, count: N), count: N)

        var i = 0
        var j = 0
        
        while i < n/2 {
            j = 0
            while j < n/2 {
                A11[i][j] = A[i][j]
                A12[i][j] = A[i][j + n/2]
                A21[i][j] = A[i + n/2][j]
                A22[i][j] = A[i + n/2][j + n/2]

                B11[i][j] = B[i][j]
                B12[i][j] = B[i][j + n/2]
                B21[i][j] = B[i + n/2][j]
                B22[i][j] = B[i + n/2][j + n/2]
                
                j += 1
            }
            i += 1
        }
        
        matrix_add(n/2, A11, A22, &AA)
        matrix_add(n/2, B11, B22, &BB)
        strassen(n/2, AA, BB, &M1)
        
        matrix_add(n/2, A21, A22, &AA)
        strassen(n/2, AA, B11, &M2)
        
        matrix_sub(n/2, B12, B22, &BB)
        strassen(n/2, A22, BB, &M3)
        
        matrix_sub(n/2, B21, B11, &BB)
        strassen(n/2, A22, BB, &M4)
    
        matrix_add(n/2, A11, A12, &AA)
        strassen(n/2, AA, B22, &M5)
        
        matrix_sub(n/2, A21, A11, &AA)
        matrix_add(n/2, B11, B12, &BB)
        strassen(n/2, AA, BB, &M6)
        
        matrix_sub(n/2, A12, A22, &AA)
        matrix_add(n/2, B21, B22, &BB)
        strassen(n/2, AA, BB, &M7)
        
        matrix_add(n/2, M1, M3, &AA)
        matrix_sub(n/2, M7, M5, &BB)
        matrix_add(n/2, AA, BB, &C11)
    
        matrix_add(n/2, M3, M5, &C12)
        
        matrix_add(n/2, M2, M4, &C21)
        
        matrix_sub(n/2, M1, M2, &AA)
        matrix_add(n/2, M3, M6, &BB)
        matrix_add(n/2, AA, BB, &C22)
    
        i = 0
        j = 0
        
        while i < n/2 {
            j = 0
            while j < n/2 {
                C[i][j] = C11[i][j]
                C[i][j + n/2] = C21[i][j]
                C[i + n/2][j] = C12[i][j]
                C[i + n/2][j + n/2] = C22[i][j]
                
                j += 1
            }
            i += 1
        }
    }
    strassen(N, ptr1, ptr2, &result)
    //
    // ------------------------------------------------------------------  Naive
    //
    /*
    while r < 1 << 12 {
        c = 0
        while c < 1 << 12 {
            i = 0
            partial = 0
            while i < 1 << 12 {
                partial += ptr1[r * (1 << 12) + i] * ptr2[i * (1 << 12) + c]
                i += 1
            }
            result[r * (1 << 12) + c] = partial
            c += 1
        }
        r += 1
    }
     */
    //
    // -------------------------------------------------------------  Concurrent
    //
    /*
    DispatchQueue.concurrentPerform(iterations: 1 << 15) { r in
        var i = 0
        result[r] = 0
        while i < 1 << 15 {
            result[r] += ptr1[r * (1 << 15) + i] * ptr2[i]
            i += 1
        }
    }
     */
    let d2 = Date()

    print(result)

    return d2.timeIntervalSince(d1)
}

@inline(never)
func test_b() -> Double {
    let ptr1 = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 30)
    let ptr2 = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 15)
    var result = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 15)
    
    defer { ptr1.deallocate(capacity: 1 << 30) }
    defer { ptr2.deallocate(capacity: 1 << 15) }
    defer { result.deallocate(capacity: 1 << 15) }
    
    let d1 = Date()
    vDSP_mmul(
        UnsafePointer(ptr1), 1,
        UnsafePointer(ptr2), 1,
        result, 1,
        1 << 15, 1, 1 << 15
    )
    let d2 = Date()
    
    print(result)
    
    return d2.timeIntervalSince(d1)
}

@inline(never)
func test_c() -> Double {
    let m1 = Matrix<Float>(nRows: 1 << 15, nColumns: 1 << 15)
    let v2 = ColumnVector<Float>(length: 1 << 15)
    
    let d1 = Date()
    let result = m1 • v2
    let d2 = Date()
    
    print(result)

    return d2.timeIntervalSince(d1)
}

let measure = true

if measure {
    let N = 1
    let a = (0 ..< N).map { _ in test_a() }
    let b = (0 ..< N).map { _ in test_b() }
//    let c = (0 ..< 100).map { _ in test_c() }
    
    print("a", "total", a.reduce(0, +), "min", a.min()!, "max", a.max()!, "avg", a.reduce(0, +) / Double(a.count))
    print("b", "total", b.reduce(0, +), "min", b.min()!, "max", b.max()!, "avg", b.reduce(0, +) / Double(b.count))
  //  print("c", "total", c.reduce(0, +), "min", c.min()!, "max", c.max()!, "avg", c.reduce(0, +) / Double(c.count))
} else {
    print(test_a(), test_b())//, test_c())
}


