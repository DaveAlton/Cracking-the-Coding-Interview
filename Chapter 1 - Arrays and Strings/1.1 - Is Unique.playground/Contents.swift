// Implement an algorithm to determine if a string as all unique characters.
func isUnique(string: String) -> Bool {
    var memo = [Character]()
    for char in string.characters {
        if memo.contains(char) {
            return false
        } else {
            memo.append(char)
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
func isUniqueNoDataStructures(string: String) -> Bool {
    let charArray = string.characters.flatMap { $0 }
    for a in charArray.enumerated() {
        for bIndex in (a.offset + 1)..<charArray.count {
            if a.element == charArray[bIndex] {
                return false
            }
        }
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
