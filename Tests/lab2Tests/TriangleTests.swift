import Testing
@testable import lab2

@Suite
struct TriangleTests {

    @Test
    func rightTriangle() {
        let triangle = Triangle(a: 3, b: 4, c: 5)

        #expect(triangle.isValid == true)
        #expect(triangle.isRight == true)
    }

    @Test
    func anotherRightTriangle() {
        let triangle = Triangle(a: 5, b: 3, c: 4)

        #expect(triangle.isRight == true)
    }

    @Test
    func normalTriangle() {
        let triangle = Triangle(a: 5, b: 5, c: 5)

        #expect(triangle.isValid == true)
        #expect(triangle.isRight == false)
    }

    @Test
    func invalidTriangle() {
        let triangle = Triangle(a: 1, b: 2, c: 10)

        #expect(triangle.isValid == false)
        #expect(triangle.isRight == false)
    }

    @Test
    func zeroSide() {
        let triangle = Triangle(a: 0, b: 4, c: 5)

        #expect(triangle.isValid == false)
    }

    @Test
    func negativeSide() {
        let triangle = Triangle(a: -3, b: 4, c: 5)

        #expect(triangle.isValid == false)
    }

    @Test
    func triangleBoundary() {
        let triangle = Triangle(a: 2, b: 3, c: 5)

        #expect(triangle.isValid == false)
    }

    @Test
    func floatingPointTriangle() {
        let triangle = Triangle(a: 3.0, b: 4.0, c: 5.0)

        #expect(triangle.isRight == true)
    }
}

