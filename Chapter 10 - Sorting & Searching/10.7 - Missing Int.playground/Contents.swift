/*
 Given an input file with four billion non-negative integers, provide an algorithm to generate an integer that is not contained in the file. Assume you have 1 GB of memory available for this task.
*/

import Foundation

func integerNotInArrayMaxMemory(array: [Int]) -> Int {
    return (array.max() ?? 0) + 1
}

integerNotInArrayMaxMemory(array: [1,2,3,4,5])
integerNotInArrayMaxMemory(array: [])

/*
 FOLLOW UP
 What if you have only 10 MB of memory? Assume that all the values are distinct and we now have no more than one billion non-negative integers.
*/

func integerNotInArrayMinMemory(array: [Int]) -> Int {
    var maxItem = 0
    for item in array {
        maxItem = max(maxItem, item)
    }
    return maxItem + 1
}

integerNotInArrayMinMemory(array: [1,2,3,4,5])
integerNotInArrayMinMemory(array: [])