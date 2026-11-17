import Testing
@testable import lab2

@Suite
struct SobrietyTests {

    @Test
    func soberState() {
        #expect(
            SobrietyState(breathalyzerReading: 0.05) == .sober
        )
    }

    @Test
    func lowerBoundary() {
        #expect(
            SobrietyState(breathalyzerReading: 0.1) == .afterDrinking
        )
    }

    @Test
    func middleValue() {
        #expect(
            SobrietyState(breathalyzerReading: 0.2) == .afterDrinking
        )
    }

    @Test
    func upperBoundary() {
        #expect(
            SobrietyState(breathalyzerReading: 0.25) == .afterDrinking
        )
    }

    @Test
    func intoxicatedState() {
        #expect(
            SobrietyState(breathalyzerReading: 0.26) == .intoxicated
        )
    }
}

