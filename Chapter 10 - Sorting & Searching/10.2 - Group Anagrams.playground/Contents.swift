/*
 Write a method to sort an array of strings so that all the anagrams are next to each other.
*/

extension String {
    func sorted() -> String {
        let characters = Array(self.characters)
        let sortedCharacters = characters.sorted(by: { $0 < $1 })
        return String(sortedCharacters)
    }
}

func groupAnagrams(_ array: [String]) -> [String] {
    var anagramDictionary = [String: [String]]()
    for string in array {
        let sortedString = string.sorted()
        if anagramDictionary[sortedString] == nil {
            anagramDictionary[sortedString] = [string]
        } else {
            anagramDictionary[sortedString]!.append(string)
        }
    }
    return anagramDictionary.values.flatMap({ $0 })
}

groupAnagrams(["bay", "alamo", "aby", "maola", "yab", "lamao", "sad"])