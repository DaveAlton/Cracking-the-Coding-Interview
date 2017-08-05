/*
 Given a sorted array of n integers that has been rotated an unknown number of times, write code to find an element in the array. You may assume that the array was originally sorted in increasing order.
 
 EXAMPLE:
 Input:find 5 in {15, 16, 19, 20, 25, 1, 3, 4, 5, 7, 10, 14}
 Output: 8 (the index of 5 in the array)
*/

import Foundation

func find(number: Int, inRotatedArray array: [Int]) -> Int? {
    guard array.count > 0 else { return nil }
    let pivot = array.count/2
    if array[pivot] == number {
        return pivot
    } else if array[pivot] < array.first! && number < array[pivot] {
        return find(number: number, inRotatedArray: Array(array[0..<pivot]))
    } else if array[pivot] > array.first! && number < array[pivot] && number > array.first! {
        return find(number: number, inRotatedArray: Array(array[0..<pivot]))
    } else {
        if let index = find(number: number, inRotatedArray: Array(array[pivot..<array.count])) {
            return pivot + index
        } else {
            return nil
        }
    }
}


find(number: 5, inRotatedArray: [15, 16, 19, 20, 25, 1, 3, 4, 5, 7, 10, 14])