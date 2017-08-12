/*
 In an array of integers, a "peak" is an element which is greater than or equal to the adjacent integers and a "valley" is an element which is less than or equal to the adjacent inte­ gers. For example, in the array {5, 8, 6, 2, 3, 4, 6}, {8, 6} are peaks and {5, 2} are valleys. Given an array of integers, sort the array into an alternating sequence of peaks and valleys.
 EXAMPLE
 Input: {5, 3, 1, 2, 3}
 Output: {5, 1, 3, 2, 3}
*/

import Foundation

func peaksAndValleys(array: [Int]) -> [Int] {
    let sortedArray = array.sorted()
    let leftHalf = Array(array[0..<(sortedArray.count/2)]).sorted()
    let rightHalf = Array(array[(sortedArray.count/2)..<sortedArray.count]).sorted()
    var longArray = leftHalf.count > rightHalf.count ? leftHalf : rightHalf
    var shortArray = leftHalf.count <= rightHalf.count ? leftHalf : rightHalf
    
    var mergedArray = [Int]()
    for i in 0..<longArray.count {
        mergedArray.append(longArray.removeFirst())
        if !shortArray.isEmpty {
            mergedArray.append(shortArray.removeFirst())
        }
    }
    
    return mergedArray
}

peaksAndValleys(array: [5, 3, 1, 2, 3])
peaksAndValleys(array: [0,1,2,3,4,5,6,7,8,9])