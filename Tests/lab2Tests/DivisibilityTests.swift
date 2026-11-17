
import Testing
@testable import lab2

@Suite
struct DivisibilityTests {

    @Test
    func divisible() {
        #expect(isDivisible(10, by: 2) == true)
    }

    @Test
    func notDivisible() {
        #expect(isDivisible(10, by: 3) == false)
    }

    @Test
    func divisionByZero() {
        #expect(isDivisible(10, by: 0) == false)
    }

    @Test
    func negativeNumbers() {
        #expect(isDivisible(-10, by: 2) == true)
    }

    @Test
    func divisorMinusOne() {
        #expect(isDivisible(7, by: -1) == true)
    }
}
