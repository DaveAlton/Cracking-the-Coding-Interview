/*
 You are given an array like data structure Listy which lacks a size method. It does, however, have an elementAt(i) method that returns the element at index i in 0(1) time. If i is beyond the bounds of the data structure, it returns -1. (For this reason, the data structure only supports positive integers.) Given a Listy which contains sorted, positive integers, find the index at which an element x occurs. If x occurs multiple times, you may return any index.
*/

import Foundation

class Listy {
    private var array: [Int]
    
    init(_ array: [Int]) {
        self.array = array
    }
    
    func elementAt(_ i: Int) -> Int {
        if i < array.count {
            return array[i]
        } else {
            return -1
        }
    }
}

func indexOf(element: Int, inListy listy: Listy) -> Int? {
    var lowerIndex = 0
    var upperIndex = 0
    while listy.elementAt(upperIndex) <= element {
        guard listy.elementAt(upperIndex) != element else { return upperIndex }
        if listy.elementAt(upperIndex) == -1 {
            upperIndex = lowerIndex + (upperIndex - lowerIndex)/2
        } else {
            if upperIndex == 0 {
                upperIndex = 2
            } else {
                lowerIndex = upperIndex
                upperIndex = upperIndex*upperIndex
            }
        }
    }
    while upperIndex - lowerIndex > 1 {
        let pivot = lowerIndex + (upperIndex - lowerIndex)/2
        guard listy.elementAt(pivot) != element else { return pivot }
        if element < listy.elementAt(pivot) {
            upperIndex = pivot
        } else {
            lowerIndex = pivot
        }
    }
    return nil
}

indexOf(element: 14, inListy: Listy([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]))
indexOf(element: 8, inListy: Listy([0,2,4,6,8,10]))
indexOf(element: 7, inListy: Listy([0,2,4,6,8,10]))
