
import Testing
@testable import lab2

@Suite
struct ValueRangeTests {

    @Test
    func belowTen() {
        #expect(ValueRange(value: 5) == .upToTen)
    }

    @Test
    func boundaryTen() {
        #expect(ValueRange(value: 10) == .upToTen)
    }

    @Test
    func boundaryEleven() {
        #expect(ValueRange(value: 11) == .elevenToTwentyFive)
    }

    @Test
    func boundaryTwentyFive() {
        #expect(ValueRange(value: 25) == .elevenToTwentyFive)
    }

    @Test
    func aboveTwentyFive() {
        #expect(ValueRange(value: 26) == .aboveTwentyFive)
    }
}
