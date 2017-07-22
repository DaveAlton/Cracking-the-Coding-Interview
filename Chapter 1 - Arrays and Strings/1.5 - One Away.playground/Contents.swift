// There are three types of edits that can be performed on strings:
// 1) Insert a character
// 2) Remove a character
// 3) Replace a character
// Given two strings, write a function to check if they are one edit (or zero edits) away.
//
// EXAMPLE:
// "pale",  "ple"  -> true
// "pales", "pale" -> true
// "pale",  "bale" -> true
// "pale",  "bake" -> false

import Foundation

extension String {
    func withoutFirstCharacter() -> String {
        return self.substring(from: self.index(self.startIndex, offsetBy: 1))
    }
}

// O(3^N)
func editsAway(a: String, b: String) -> Int {
    guard a.characters.count > 0 else { return b.characters.count }
    guard b.characters.count > 0 else { return a.characters.count }
    if a.characters.first == b.characters.first {
        return 0 + editsAway(a: a.withoutFirstCharacter(), b: b.withoutFirstCharacter())
    } else {
        let removeB = editsAway(a: a, b: b.withoutFirstCharacter())
        let removeA = editsAway(a: a.withoutFirstCharacter(), b: b)
        let replace = editsAway(a: a.withoutFirstCharacter(), b: b.withoutFirstCharacter())
        return 1 + min(removeB, removeA, replace)
    }
}

func oneOrFewerEditsAway(a: String, b: String) -> Bool {
    return editsAway(a: a, b: b) <= 1
}

// TRUE
oneOrFewerEditsAway(a: "pale", b: "ple")

// TRUE
oneOrFewerEditsAway(a: "pales", b: "pale")

// TRUE
oneOrFewerEditsAway(a: "pale", b: "bale")

// FALSE
oneOrFewerEditsAway(a: "pale", b: "bake")

// TRUE
oneOrFewerEditsAway(a: "pale", b: "pale")

// TRUE
oneOrFewerEditsAway(a: "", b: "")

// TRUE
oneOrFewerEditsAway(a: "", b: "a")

// FALSE
oneOrFewerEditsAway(a: "A", b: "aa")

// TRUE
oneOrFewerEditsAway(a: " ", b: " ")

// FALSE
oneOrFewerEditsAway(a: "ba", b: "ab")