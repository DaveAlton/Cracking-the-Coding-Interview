// Write a method to replace all spaces in a string with '%20'. 
// You may assume that the string has sufficient space at the end to hold the additional characters, 
// and that you are given the "true" length of the string.
//
// EXAMPLE:
// Input:  "Mr John Smith" - 13 characters
// Output: "Mr%20John%20Smith"

func urlify(string: String) -> String {
    let inputCharacters  = string.characters.flatMap({ $0 }) // O(N)
    var outputCharacters = [Character]()
    for char in inputCharacters { // O(N)
        if char == " " {
            outputCharacters += ["%", "2", "0"]
        } else {
            outputCharacters.append(char)
        }
    }
    return String(outputCharacters)
}

// "Mr%20John%20Smith"
urlify(string: "Mr John Smith")

// "Mr%20John"
urlify(string: "Mr John")

// "%20Mr"
urlify(string: " Mr")

// "%20"
urlify(string: " ")

// ""
urlify(string: "")

// "M"
urlify(string: "M")

// "%20"
urlify(string: "  ")
