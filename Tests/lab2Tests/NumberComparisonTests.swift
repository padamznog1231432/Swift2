import Testing
@testable import lab2

@Suite
struct NumberComparisonTests {

    @Test
    func differentNumbers() {
        let result = comparison(of: 3, 8, 5)

        #expect(result.largest == 8)
        #expect(result.allIdentical == false)
        #expect(result.twoIdentical == false)
    }

    @Test
    func allIdentical() {
        let result = comparison(of: 5, 5, 5)

        #expect(result.largest == nil)
        #expect(result.allIdentical == true)
        #expect(result.twoIdentical == false)
    }

    @Test
    func firstTwoIdentical() {
        let result = comparison(of: 5, 5, 3)

        #expect(result.twoIdentical == true)
    }

    @Test
    func firstAndThirdIdentical() {
        let result = comparison(of: 5, 3, 5)

        #expect(result.twoIdentical == true)
    }

    @Test
    func lastTwoIdentical() {
        let result = comparison(of: 3, 5, 5)

        #expect(result.twoIdentical == true)
        #expect(result.largest == 5)
    }

    @Test
    func negativeNumbers() {
        let result = comparison(of: -5, -2, -8)

        #expect(result.largest == -2)
    }
}
