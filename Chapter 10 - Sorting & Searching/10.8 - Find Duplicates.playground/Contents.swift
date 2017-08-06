/*
 You have an array with all the numbers from 1 to N, where N is at most 32,000. The array may have duplicate entries and you do not know what N is. With only 4 kilobytes of memory available, how would you print all duplicate elements in the array?
*/

import Foundation

// Because of time constraints, I'm only going to generate a an array of 3200
// array from 1...31,999, with ~1/100 numbers being duplicates
func arrayExample() -> [Int] {
    var array = [Int]()
    for i in 1..<3200 {
        array.append(i)
        if arc4random_uniform(10) == 1 {
            array.append(i)
        }
    }
    return array
}

func duplicatesInArray(array: [Int]) -> [Int]{
    guard array.count > 0 else { return [] }
    guard array.count != array.last! else { return [] }
    
    var minIndex = 0
    var maxIndex = array.count
    let duplicateCount = array.count - array.last!
    var duplicates = [Int]()
    var pivot = array.count/2
    while duplicates.count < duplicateCount {
        let pivotWithDuplicates = min(pivot + duplicates.count, array.count - 1)
        if pivot < array[pivotWithDuplicates] {
            minIndex = pivot
            if array[pivotWithDuplicates] == array[pivotWithDuplicates + 1] {
                duplicates.append(array[pivotWithDuplicates])
                maxIndex = array.count
            }
        } else {
            maxIndex = pivot
        }
        pivot = minIndex + (maxIndex - minIndex)/2
    }
    return duplicates
}

duplicatesInArray(array: arrayExample())
