// A magic index in an array A[0..<n] is defined to be an index
// such that A[i] = i. Given a sorted array of distinct integers,
// write a method to find a magic index, if one exists, in array A.

func magicIndex(inArray array: [Int], withOffset offset: Int = 0) -> Int? {
    guard array.count > 0 else { return nil }
    guard array.count != 1 else { return array[0] == offset ? offset : nil }
    var pivot = array.count/2
    if array[pivot] == pivot + offset {
        return pivot + offset
    } else if array[pivot] > pivot + offset {
        return magicIndex(inArray: Array(array[0..<pivot]))
    } else {
        return magicIndex(inArray: Array(array[pivot..<array.count]), withOffset: pivot + offset)
    }
}

//                  v
var array = [-1,0,1,3,5,7,8,9,10]
magicIndex(inArray: array)

array = [-10,10,11,13,15,17,18,19,110]
magicIndex(inArray: array)

//                    v
array = [-10,-5,0,1,3,5,7,8,9,10]
magicIndex(inArray: array)
