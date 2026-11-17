import Testing
@testable import lab2

@Suite
struct QuadraticTests {

    @Test
    func twoRoots() {
        let result = solveQuadratic(a: 1, b: -3, c: 2)

        if case .twoRoots(let x1, let x2) = result {
            #expect(abs(x1 - 1) < 0.000001)
            #expect(abs(x2 - 2) < 0.000001)
        } else {
            Issue.record("Oczekiwano dwoch pierwiastkow")
        }
    }

    @Test
    func oneRoot() {
        let result = solveQuadratic(a: 1, b: 2, c: 1)

        if case .oneRoot(let x) = result {
            #expect(abs(x + 1) < 0.000001)
        } else {
            Issue.record("Oczekiwano jednego pierwiastka")
        }
    }

    @Test
    func noRealRoots() {
        let result = solveQuadratic(a: 1, b: 1, c: 5)

        if case .noRealRoots = result {
            #expect(true)
        } else {
            Issue.record("Oczekiwano braku pierwiastkow")
        }
    }

    @Test
    func linearEquation() {
        let result = solveQuadratic(a: 0, b: 2, c: -4)

        if case .linear(let x) = result {
            #expect(abs(x - 2) < 0.000001)
        } else {
            Issue.record("Oczekiwano rownania liniowego")
        }
    }

    @Test
    func notAnEquation() {
        let result = solveQuadratic(a: 0, b: 0, c: 5)

        if case .notAnEquation = result {
            #expect(true)
        } else {
            Issue.record("Oczekiwano notAnEquation")
        }
    }

    @Test
    func negativeA() {
        let result = solveQuadratic(a: -1, b: 3, c: -2)

        if case .twoRoots(let x1, let x2) = result {
            #expect(x1 < x2)
            #expect(abs(x1 - 1) < 0.000001)
            #expect(abs(x2 - 2) < 0.000001)
        } else {
            Issue.record("Oczekiwano dwoch pierwiastkow")
        }
    }
}

