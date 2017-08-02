/*
 Implement an algorithm to print all valid (e.g., properly opened and closed) combinations of n pairs of parentheses.
 EXAMPLE
 Input: 3
 Output: ((())), (()()), (())(), ()(()), ()()()
*/

import Foundation

func parens(pairCount: Int) -> [String] {
    func parens(left: Int, right: Int, prefix: String = "", openCount: Int = 0) -> [String] {
        guard right > 0 else { return [] }
        guard left > 0 else  {
            var end = ""
            for _ in 1...openCount {
                end += ")"
            }
            return [prefix + end]
        }
        var permutations = [String]()
        if openCount > 0 {
            if right > 0 {
                permutations += parens(left: left, right: right - 1, prefix: prefix + ")", openCount: openCount - 1)
            }
        }
        if left > 0 {
            permutations += parens(left: left - 1, right: right, prefix: prefix + "(", openCount: openCount + 1)
        }
        return permutations
    }
    return parens(left: pairCount, right: pairCount)
}

parens(pairCount: 1)
parens(pairCount: 2)
parens(pairCount: 3)