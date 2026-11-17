import Testing
@testable import lab2

@Suite
struct MaximumSummaryTests {

    @Test
    func differentNumbers() {
        let result = maximumSummary(of: [1, 2, 3, 4])

        #expect(result.value == 4)
        #expect(result.allEqual == false)
        #expect(result.hasMultipleMaxima == false)
    }

    @Test
    func allEqual() {
        let result = maximumSummary(of: [5, 5, 5, 5])

        #expect(result.value == 5)
        #expect(result.allEqual == true)
        #expect(result.hasMultipleMaxima == true)
    }

    @Test
    func multipleMaximums() {
        let result = maximumSummary(of: [1, 8, 8, 3])

        #expect(result.value == 8)
        #expect(result.hasMultipleMaxima == true)
    }

    @Test
    func oneMaximum() {
        let result = maximumSummary(of: [2, 3, 4, 1])

        #expect(result.value == 4)
        #expect(result.hasMultipleMaxima == false)
    }

    @Test
    func emptyArray() {
        let result = maximumSummary(of: [])

        #expect(result.value == nil)
        #expect(result.allEqual == false)
        #expect(result.hasMultipleMaxima == false)
    }

    @Test
    func negativeNumbers() {
        let result = maximumSummary(of: [-5, -2, -8, -3])

        #expect(result.value == -2)
    }
}

