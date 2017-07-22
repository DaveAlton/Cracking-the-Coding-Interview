// Implement a method to perform basic string compression using the counts of repeated characters.
// For example, the string'aabcccccaaa' would become 'a2b1c5a3'. If the "compressed" string
// would not be smaller than the original string, your method should return the original string.
// You can assume the string has only uppercase and lowercase letters (a-zA-Z).

func compressedString(string: String) -> String {
    var compressedString = ""
    var currentCharacter: Character?
    var currentCharacterCount = 0
    for char in string.characters.enumerated() { // O(N)
        if char.offset == string.characters.count - 1 {
            compressedString += "\(char.element)\(currentCharacterCount + 1)"
        }
        if let currentChar = currentCharacter {
            if char.element == currentChar {
                currentCharacterCount += 1
            } else {
                compressedString += "\(currentChar)\(currentCharacterCount)"
                currentCharacter = char.element
                currentCharacterCount = 1
            }
        } else {
            currentCharacter = char.element
            currentCharacterCount = 1
        }
    }
    return compressedString.characters.count < string.characters.count ? compressedString : string
}

// a2b1c5a3
compressedString(string: "aabcccccaaa")

// abc
compressedString(string: "abc")

// a3
compressedString(string: "aaa")

// aa
compressedString(string: "aa")

//
compressedString(string: "")

// a3A3
compressedString(string: "aaaAAA")
