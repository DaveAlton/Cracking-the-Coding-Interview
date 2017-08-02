/*
 Write a method to compute all permutations of a string whose characters are not necessarily unique. The list of permutations should not have duplicates.
 */

import Foundation
func purmutationsWithDups(string: String) -> [String] {
    func removeDups(string: String) -> String {
        var characterCounts = [Character: Int]()
        var deduplicatedString = ""
        for character in string.characters {
            characterCounts[character] = (characterCounts[character] ?? 0) + 1
            if characterCounts[character]! < 2 {
                deduplicatedString.append(character)
            }
        }
        return deduplicatedString
    }
    func purmutationsWithoutDups(string: String) -> [String] {
        guard string.characters.count > 0 else { return [] }
        guard string.characters.count > 1 else { return [string] }
        guard string.characters.count > 2 else { return [string, String(string.characters.reversed()) ] }
        var strings = [String]()
        for character in string.characters {
            let stringWithoutCharacter = string.replacingOccurrences(of: character.description, with: "")
            for permutation in purmutationsWithoutDups(string: stringWithoutCharacter) {
                strings.append("\(character)" + permutation)
            }
        }
        return strings
    }
    return purmutationsWithoutDups(string: removeDups(string: string))
}


purmutationsWithDups(string: "iam")

purmutationsWithDups(string: "attack")

purmutationsWithDups(string: "aaaaa")
