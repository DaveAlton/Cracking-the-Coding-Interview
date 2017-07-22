// Given a string, write a function to check if it is a permutation of a palindrome.
// A palindrome is a word or phrase that is the same forwards and backwards.
// A permutation is a rearrangement of letters.
// The palindrome does not need to be limited to just dictionary words.
//
// EXAMPLE:
// Input:  "Tact Coa"
// Output: True (permutations: "taco cat", "atco cta", etc)

import Foundation

func isPalindromePermutation(string: String) -> Bool {
    var characterCounts = [Character: Int]()
    for char in string.replacingOccurrences(of: " ", with: "").lowercased().characters { // O(N)
        characterCounts[char] = (characterCounts[char] ?? 0) + 1                         // O(1)
    }
    var middleCharacterUsed = false
    for count in characterCounts.values {                                                // O(N)
        if count % 2 == 1 {
            if middleCharacterUsed {
                return false
            } else {
                middleCharacterUsed = true
            }
        }
    }
    return true
}

// TRUE
isPalindromePermutation(string: "Tact Coa")

// FALSE
isPalindromePermutation(string: "Tact Coaa")

// FALSE
isPalindromePermutation(string: "Tact oa")

// TRUE
isPalindromePermutation(string: "")

// TRUE
isPalindromePermutation(string: " ")

// TRUE
isPalindromePermutation(string: "a")

// TRUE
isPalindromePermutation(string: "Tt")