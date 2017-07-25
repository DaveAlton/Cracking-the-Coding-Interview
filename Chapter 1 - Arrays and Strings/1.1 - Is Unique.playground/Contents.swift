// Implement an algorithm to determine if a string as all unique characters.
func isUnique(string: String) -> Bool {
    var memo = [Character: Bool]()
    for char in string.characters { // O(N) <- This is the final speed result
        if memo[char] == true {     // O(1)
            return false
        } else {
            memo[char] = true
        }
    }
    return true
}

// TRUE
isUnique(string: "abcdefg890")

// FALSE
isUnique(string: "aabbcc")

// TRUE
isUnique(string: "")

// TRUE
isUnique(string: "a")




// What if you cannot use additional data structures?
// Ok, I cheated a little on this one. In anticipation of Swift 4, 
// I created a character array much like how strings can be used in the future.
import Foundation

func isUniqueNoDataStructures(string: String) -> Bool {
    var previous: Character?                          // Space is O(1)
    let sortedCharacters = string.characters.sorted() // O(logN)
    for char in sortedCharacters {                    // O(N) <- This is the final speed result
        if let previous = previous {
            if previous == char {
                return false
            }
        }
        previous = char
    }
    return true
}

// TRUE
isUniqueNoDataStructures(string: "abcdefg890")

// FALSE
isUniqueNoDataStructures(string: "aabbcc")

// TRUE
isUniqueNoDataStructures(string: "")

// TRUE
isUniqueNoDataStructures(string: "a")
