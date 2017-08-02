/*
 Write a method to compute all permutations of a string of unique characters.
*/

import Foundation

func purmutationsWithoutDups(string: String) -> [String] {
    guard string.characters.count > 0 else { return [] }
    var strings = [String]()
    for i in 0..<string.characters.count {
        strings.append(string.substring(to: string.index(string.endIndex, offsetBy: -i)))
    }
    strings.append(contentsOf: purmutationsWithoutDups(string: string.substring(from: string.index(string.startIndex, offsetBy: 1))))
    return strings
}

purmutationsWithoutDups(string: "iam")

purmutationsWithoutDups(string: "aquick")

purmutationsWithoutDups(string: "aquickbrownfox")
