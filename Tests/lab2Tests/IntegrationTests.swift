import Testing
@testable import lab2

@Suite
struct IntegrationTests {

    @Test
    func correctInput() {
        let result = runDivisibility(input: ["10", "2"])

        #expect(result == ["Tak"])
    }

    @Test
    func notDivisibleInput() {
        let result = runDivisibility(input: ["10", "3"])

        #expect(result == ["Nie"])
    }

    @Test
    func invalidNumberInput() {
        let result = runDivisibility(input: ["abc", "2"])

        #expect(result == ["Niepoprawne dane"])
    }

    @Test
    func missingSecondNumber() {
        let result = runDivisibility(input: ["10"])

        #expect(result == ["Niepoprawne dane"])
    }

    @Test
    func emptyInput() {
        let result = runDivisibility(input: [])

        #expect(result == ["Niepoprawne dane"])
    }

    @Test
    func divisionByZero() {
        let result = runDivisibility(input: ["10", "0"])

        #expect(result == ["Nie"])
    }
}

