import Accelerate
import Foundation
import Matrices

@inline(never)
func test_a() -> Double {
    let ptr1 = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 25)
    let ptr2 = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 25)
    
    defer { ptr1.deallocate(capacity: 1 << 25) }
    defer { ptr2.deallocate(capacity: 1 << 25) }

    var result: Float = 0
    var i = 0
    
    let d1 = Date()
    while i < 1 << 25 {
        result += ptr1[i] * ptr2[i]
        i += 1
    }
    let d2 = Date()

    print(result)
    
    return d2.timeIntervalSince(d1)
}

@inline(never)
func test_b() -> Double {
    let ptr1 = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 25)
    let ptr2 = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 25)
    
    defer { ptr1.deallocate(capacity: 1 << 25) }
    defer { ptr2.deallocate(capacity: 1 << 25) }
    
    //var result: Float = 0
    var result = UnsafeMutablePointer<Float>.allocate(capacity: 1 << 25)
    defer { result.deallocate(capacity: 1 << 25) }

    let d1 = Date()
    vDSP_vadd(
        UnsafePointer(ptr1), 1,
        UnsafePointer(ptr2), 1,
        result, 1,
        1 << 25
    )
    /*vDSP_dotpr(
        UnsafePointer(ptr1), 1,
        UnsafePointer(ptr2), 1,
        &result,
        1 << 25
    )*/
    let d2 = Date()
    
    print(result)
    
    return d2.timeIntervalSince(d1)
}

@inline(never)
func test_c() -> Double {
    let v1 = ColumnVector<Float>(length: 1 << 25)
    let v2 = ColumnVector<Float>(length: 1 << 25)

    let d1 = Date()
    let result = v1 + v2
    let d2 = Date()
    
    print(result)

    return d2.timeIntervalSince(d1)
}

let measure = false

if measure {
    let a = (0 ..< 1000).map { _ in test_a() }
    let b = (0 ..< 1000).map { _ in test_b() }
    let c = (0 ..< 1000).map { _ in test_c() }
    
    print("a", "total", a.reduce(0, +), "min", a.min()!, "max", a.max()!, "avg", a.reduce(0, +) / Double(a.count))
    print("b", "total", b.reduce(0, +), "min", b.min()!, "max", b.max()!, "avg", b.reduce(0, +) / Double(b.count))
    print("c", "total", c.reduce(0, +), "min", c.min()!, "max", c.max()!, "avg", c.reduce(0, +) / Double(c.count))
} else {
    print(test_a(), test_b(), test_c())
}


