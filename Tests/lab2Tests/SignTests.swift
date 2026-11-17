import Testing
@testable import lab2

@Suite
struct SignTests {

    @Test
    func negativeNumber() {
        #expect(Sign(of: -5) == .negative)
    }

    @Test
    func zeroNumber() {
        #expect(Sign(of: 0) == .zero)
    }

    @Test
    func positiveNumber() {
        #expect(Sign(of: 5) == .positive)
    }

    @Test
    func evenNumber() {
        #expect(4.isEven == true)
    }

    @Test
    func oddNumber() {
        #expect(3.isEven == false)
    }

    @Test
    func negativeRemainder() {
        #expect((-3).remainderModuloTwo == -1)
    }

    @Test
    func zeroIsEven() {
        #expect(0.isEven == true)
    }
}
