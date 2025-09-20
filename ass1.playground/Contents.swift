// Assignment #1: My Life Story in Swift

// Personal Information
let currentYear = 2025
var firstName: String = "Dana"
var lastName: String = "Rashid"
var birthYear: Int = 2005
var age: Int = 19
var isStudent: Bool = true
var height: Double = 1.68


// Hobbies and Interests
var hobby: String = "Photography 📸"
var numberOfHobbies: Int = 3
var favoriteNumber: Int = 7
var isHobbyCreative: Bool = true
var extraHobby: String = "Fashion 👗"

// Life Story (string interpolation)
var lifeStory: String = """
My name is \(firstName) \(lastName).
I am \(age) years old, born in \(birthYear).
Currently a student: \(isStudent).
My height is \(height) meters.
My favorite hobby is \(hobby), creative: \(isHobbyCreative).
I also like \(extraHobby).
In total I have \(numberOfHobbies) hobbies, and my favorite number is \(favoriteNumber).
"""

// Print the result
print(lifeStory)
