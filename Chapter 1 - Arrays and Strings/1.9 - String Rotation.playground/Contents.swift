// Assume you have a method `isSubstring` which checks if one word is a substring of another. 
// Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to `isSubstring` 
// (eg. "waterbottle" is a rotation of "erbottlewat").

import Foundation

func isSubstring(substring: String, of string: String) -> Bool {
    return string.contains(substring)
}

func isRotation(s1: String, s2: String) -> Bool {
    guard s1.characters.count == s2.characters.count else { return false }
    guard s1 != "" else { return true }
    let s1 = s1 + s1
    return isSubstring(substring: s2, of: s1)
}

// TRUE
isRotation(s1: "waterbottle", s2: "erbottlewat")

// TRUE
isRotation(s1: "erbottlewat", s2: "waterbottle")

// FALSE
isRotation(s1: "abc", s2: "cba")

// TRUE - If the question specifically forbade same-words from returning true, a simple guard could be added on line 13.
// guard s1 != s2 else { return false }
isRotation(s1: "waterbottle", s2: "waterbottle")

// TRUE
isRotation(s1: "", s2: "")