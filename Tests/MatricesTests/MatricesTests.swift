import XCTest
@testable import Matrices

class MatricesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Matrices().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
