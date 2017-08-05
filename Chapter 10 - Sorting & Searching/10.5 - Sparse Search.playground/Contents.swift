/*
 Given a sorted array of strings that is interspersed with empty strings, write a method to  nd the location of a given string.
 
 EXAMPLE
 Input: ball,{"at", "", "", "", "ball", "", "", "car", "", "", "dad", "", "", ""}
 Output: 4
*/

import Foundation

func indexOf(word: String, inArray array: [String]) -> Int? {
    func midPoint() -> (word: String, index: Int)? {
        var lower = array.count/2
        var upper = lower + 1
        while upper < array.count && lower > 0 {
            if array[lower] != "" {
                return (word: array[lower], index: lower)
            }
            if array[upper] != "" {
                return (word: array[upper], index: upper)
            }
            upper += 1
            lower -= 1
        }
        return nil
    }
    
    if let mid = midPoint() {
        if mid.word == word {
            return mid.index
        } else if mid.word < word {
            if let foundIndex = indexOf(word: word, inArray: Array(array[mid.index..<array.count])) {
                return mid.index + foundIndex
            }
        } else {
            if let foundIndex = indexOf(word: word, inArray: Array(array[0..<mid.index])) {
                return foundIndex
            }
        }
    }
    
    return nil
}

indexOf(word: "ball", inArray: ["at", "", "", "", "ball", "", "", "car", "", "", "dad", "", "", ""])

indexOf(word: "dad", inArray: ["at", "", "", "", "ball", "", "", "car", "", "", "dad", "", "", ""])
