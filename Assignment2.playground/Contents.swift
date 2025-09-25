import Foundation

// Problem 1: FizzBuzz
for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}


// Problem 2: Prime Numbers
func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
for n in 1...100 {
    if isPrime(n) {
        print(n, terminator: " ")
    }
}
print("\n")


// Problem 3: Temperature Converter
func celsiusToFahrenheit(_ c: Double) -> Double { return (c * 9/5) + 32 }
func celsiusToKelvin(_ c: Double) -> Double { return c + 273.15 }
func fahrenheitToCelsius(_ f: Double) -> Double { return (f - 32) * 5/9 }
func fahrenheitToKelvin(_ f: Double) -> Double { return (f - 32) * 5/9 + 273.15 }
func kelvinToCelsius(_ k: Double) -> Double { return k - 273.15 }
func kelvinToFahrenheit(_ k: Double) -> Double { return (k - 273.15) * 9/5 + 32 }

let temp = 25.0
let unit = "C"   // можно поменять на "F" или "K"
if unit == "C" {
    print("\(temp)°C = \(celsiusToFahrenheit(temp))°F, \(celsiusToKelvin(temp))K")
} else if unit == "F" {
    print("\(temp)°F = \(fahrenheitToCelsius(temp))°C, \(fahrenheitToKelvin(temp))K")
} else if unit == "K" {
    print("\(temp)K = \(kelvinToCelsius(temp))°C, \(kelvinToFahrenheit(temp))°F")
}


// Problem 4: Shopping List Manager
var shoppingList: [String] = []
shoppingList.append("Milk")
shoppingList.append("Eggs")
shoppingList.append("Bread")
print("Shopping List:", shoppingList)
shoppingList.remove(at: 1)
print("Updated Shopping List:", shoppingList)


// Problem 5: Word Frequency Counter
let sentence = "Swift is fun and Swift is powerful"
var frequency: [String: Int] = [:]
let words = sentence.lowercased().components(separatedBy: " ")
for word in words {
    frequency[word, default: 0] += 1
}
print("Word Frequencies:", frequency)


// Problem 6: Fibonacci Sequence
func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 { return [] }
    if n == 1 { return [0] }
    var sequence = [0, 1]
    while sequence.count < n {
        let next = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(next)
    }
    return sequence
}
print("Fibonacci 10:", fibonacci(10))

// ------------------------------------------------
// Problem 7: Grade Calculator
let students = ["Dana": 90, "Akerke": 75, "Nurdana": 88, "Temirlan": 95]
let scores = Array(students.values)
let avg = scores.reduce(0, +) / scores.count
print("Average Score:", avg)
print("Highest:", scores.max() ?? 0)
print("Lowest:", scores.min() ?? 0)
for (name, score) in students {
    print("\(name): \(score) (\(score >= avg ? "Above" : "Below") average)")
}


// Problem 8: Palindrome Checker
func isPalindrome(_ text: String) -> Bool {
    let clean = text.lowercased().filter { $0.isLetter }
    return clean == String(clean.reversed())
}
print("Is 'level' a palindrome? ->", isPalindrome("level"))
print("Is 'Swift' a palindrome? ->", isPalindrome("Swift"))


// Problem 9: Simple Calculator
func add(_ a: Double, _ b: Double) -> Double { return a + b }
func subtract(_ a: Double, _ b: Double) -> Double { return a - b }
func multiply(_ a: Double, _ b: Double) -> Double { return a * b }
func divide(_ a: Double, _ b: Double) -> Double {
    return b == 0 ? Double.nan : a / b
}
let a = 10.0, b = 5.0
print("Add:", add(a, b))
print("Subtract:", subtract(a, b))
print("Multiply:", multiply(a, b))
print("Divide:", divide(a, b))


// Problem 10: Unique Characters
func hasUniqueCharacters(_ text: String) -> Bool {
    var set: Set<Character> = []
    for char in text {
        if set.contains(char) {
            return false
        }
        set.insert(char)
    }
    return true
}
print("Has unique characters? 'Swift' ->", hasUniqueCharacters("Swift"))
print("Has unique characters? 'Hello' ->", hasUniqueCharacters("Hello"))
