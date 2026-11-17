
import Foundation


/*1*/


func isDivisible(_ a: Int, by b: Int) -> Bool {
    if b == 0 {
        return false
    }

    if b == -1 {
        return true
    }

    return a % b == 0
}



/*2*/

enum ValueRange {
    case upToTen
    case elevenToTwentyFive
    case aboveTwentyFive

    init(value: Int) {
        if value <= 10 {
            self = .upToTen
        } else if value <= 25 {
            self = .elevenToTwentyFive
        } else {
            self = .aboveTwentyFive
        }
    }
}



/*3*/

struct NumberComparison {
    let largest: Int?
    let allIdentical: Bool
    let twoIdentical: Bool
}

func comparison(of a: Int, _ b: Int, _ c: Int) -> NumberComparison {

    let allSame = a == b && b == c

    let twoSame =
        (a == b && b != c) ||
        (a == c && a != b) ||
        (b == c && a != b)

    var largest: Int? = nil

    if !allSame {
        if a >= b && a >= c {
            largest = a
        } else if b >= a && b >= c {
            largest = b
        } else {
            largest = c
        }
    }

    return NumberComparison(
        largest: largest,
        allIdentical: allSame,
        twoIdentical: twoSame
    )
}



/*4*/

enum Sign {
    case negative
    case zero
    case positive

    init(of value: Int) {
        if value < 0 {
            self = .negative
        } else if value == 0 {
            self = .zero
        } else {
            self = .positive
        }
    }
}

extension Int {

    var isEven: Bool {
        return self % 2 == 0
    }

    var remainderModuloTwo: Int {
        return self % 2
    }
}



/*5*/

enum SobrietyState {
    case sober
    case afterDrinking
    case intoxicated

    init(breathalyzerReading reading: Double) {
        if reading < 0.1 {
            self = .sober
        } else if reading <= 0.25 {
            self = .afterDrinking
        } else {
            self = .intoxicated
        }
    }
}



/*6*/

struct MaximumSummary {
    let value: Int?
    let allEqual: Bool
    let hasMultipleMaxima: Bool
}

func maximumSummary(of numbers: [Int]) -> MaximumSummary {

    guard let maxValue = numbers.max() else {
        return MaximumSummary(
            value: nil,
            allEqual: false,
            hasMultipleMaxima: false
        )
    }

    let allEqual = numbers.allSatisfy {
        $0 == numbers[0]
    }

    let countMax = numbers.filter {
        $0 == maxValue
    }.count

    return MaximumSummary(
        value: maxValue,
        allEqual: allEqual,
        hasMultipleMaxima: countMax > 1
    )
}


/*7*/

enum QuadraticSolution {
    case twoRoots(x1: Double, x2: Double)
    case oneRoot(x: Double)
    case noRealRoots
    case linear(x: Double)
    case notAnEquation
}

func solveQuadratic(
    a: Double,
    b: Double,
    c: Double
) -> QuadraticSolution {

    if a == 0 {
        if b == 0 {
            return .notAnEquation
        }

        return .linear(x: -c / b)
    }

    let delta = b * b - 4 * a * c

    if delta < 0 {
        return .noRealRoots
    } else if delta == 0 {
        let x = -b / (2 * a)
        return .oneRoot(x: x)
    } else {
        let sqrtDelta = sqrt(delta)

        let x1 = (-b - sqrtDelta) / (2 * a)
        let x2 = (-b + sqrtDelta) / (2 * a)

        return .twoRoots(
            x1: min(x1, x2),
            x2: max(x1, x2)
        )
    }
}



/*8*/

struct Triangle {

    let a: Double
    let b: Double
    let c: Double

    var isValid: Bool {
        return a.isFinite &&
               b.isFinite &&
               c.isFinite &&
               a > 0 &&
               b > 0 &&
               c > 0 &&
               a + b > c &&
               a + c > b &&
               b + c > a
    }

    var isRight: Bool {

        if !isValid {
            return false
        }

        let sides = [a, b, c].sorted()

        let x = sides[0]
        let y = sides[1]
        let z = sides[2]

        let difference = abs(x * x + y * y - z * z)

        return difference < 0.000001
    }
}



func runDivisibility(input: [String]) -> [String] {

    guard input.count >= 2,
          let a = Int(input[0]),
          let b = Int(input[1]) else {
        return ["Niepoprawne dane"]
    }

    let result = isDivisible(a, by: b)

    return [result ? "Tak" : "Nie"]
}


func readInt(_ message: String) -> Int? {
    print(message)

    guard let input = readLine(),
          let number = Int(input) else {
        print("Niepoprawna liczba!")
        return nil
    }

    return number
}

func readDouble(_ message: String) -> Double? {
    print(message)

    guard let input = readLine(),
          let number = Double(input),
          number.isFinite else {
        print("Niepoprawna liczba!")
        return nil
    }

    return number
}



/*menu*/
func main() {


    print("1. Podzielnosc liczb")
    print("2. Przedzialy liczbowe")
    print("3. Porownanie trzech liczb")
    print("4. Znak i parzystosc")
    print("5. Symulator alkomatu")
    print("6. Najwieksza z czterech liczb")
    print("7. Rownanie kwadratowe")
    print("8. Trojkat prostokatny")

    guard let choice = readInt("Wybierz zadanie:") else {
        return
    }

    switch choice {

    case 1:

        print("Podaj liczbe a:")
        guard let a = readLine() else { return }

        print("Podaj liczbe b:")
        guard let b = readLine() else { return }

        let result = runDivisibility(input: [a, b])
        print(result[0])

    case 2:

        guard let value = readInt("Podaj liczbe:") else {
            return
        }

        switch ValueRange(value: value) {
        case .upToTen:
            print("Liczba jest mniejsza lub rowna 10.")

        case .elevenToTwentyFive:
            print("Liczba jest od 11 do 25.")

        case .aboveTwentyFive:
            print("Liczba jest wieksza od 25.")
        }

    case 3:

        guard let a = readInt("Podaj pierwsza liczbe:"),
              let b = readInt("Podaj druga liczbe:"),
              let c = readInt("Podaj trzecia liczbe:") else {
            return
        }

        let result = comparison(of: a, b, c)

        if result.allIdentical {
            print("Wszystkie liczby sa identyczne.")
            print("Nie ma jednej najwiekszej liczby.")
        } else {
            print("Najwieksza liczba: \(result.largest!)")
        }

        print("Wszystkie identyczne: \(result.allIdentical)")
        print("Dokladnie dwie identyczne: \(result.twoIdentical)")

    case 4:

        guard let number = readInt("Podaj liczbe:") else {
            return
        }

        switch Sign(of: number) {
        case .negative:
            print("Liczba ujemna.")
        case .zero:
            print("Liczba rowna zero.")
        case .positive:
            print("Liczba dodatnia.")
        }

        print("Parzysta: \(number.isEven)")
        print("Reszta z dzielenia przez 2: \(number.remainderModuloTwo)")

    case 5:

        guard let reading = readDouble("Podaj wynik pomiaru w mg/dm3:"),
              reading >= 0 else {
            print("Niepoprawny wynik pomiaru.")
            return
        }

        switch SobrietyState(breathalyzerReading: reading) {
        case .sober:
            print("Stan trzezwosci.")
        case .afterDrinking:
            print("Stan po uzyciu alkoholu.")
        case .intoxicated:
            print("Stan nietrzezwosci.")
        }

    case 6:

        var numbers: [Int] = []

        for i in 1...4 {
            guard let number = readInt("Podaj liczbe \(i):") else {
                return
            }

            numbers.append(number)
        }

        let result = maximumSummary(of: numbers)

        print("Najwieksza liczba: \(result.value!)")
        print("Wszystkie rowne: \(result.allEqual)")
        print("Wiecej niz jedno maksimum: \(result.hasMultipleMaxima)")

    case 7:

        guard let a = readDouble("Podaj a:"),
              let b = readDouble("Podaj b:"),
              let c = readDouble("Podaj c:") else {
            return
        }

        switch solveQuadratic(a: a, b: b, c: c) {

        case .twoRoots(let x1, let x2):
            print("Dwa pierwiastki:")
            print("x1 = \(x1)")
            print("x2 = \(x2)")

        case .oneRoot(let x):
            print("Jeden pierwiastek: \(x)")

        case .noRealRoots:
            print("Brak pierwiastkow rzeczywistych.")

        case .linear(let x):
            print("Rownanie liniowe. x = \(x)")

        case .notAnEquation:
            print("To nie jest rownanie.")
        }

    case 8:

        guard let a = readDouble("Podaj bok a:"),
              let b = readDouble("Podaj bok b:"),
              let c = readDouble("Podaj bok c:") else {
            return
        }

        let triangle = Triangle(a: a, b: b, c: c)

        if !triangle.isValid {
            print("Nie mozna zbudowac trojkata.")
        } else if triangle.isRight {
            print("Trojkat jest prostokatny.")
        } else {
            print("Trojkat nie jest prostokatny.")
        }

    default:
        print("Nie ma takiego zadania.")
    }
}

main()
