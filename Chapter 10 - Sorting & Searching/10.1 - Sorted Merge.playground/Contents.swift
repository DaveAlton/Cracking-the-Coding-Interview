/*
 You are given two sorted arrays, A and B, where A has a large enough buffer at the end to hold B. Write a method to merge B into A in sorted order.
*/

func sortedMerge(a: [Int], b: [Int]) -> [Int] {
    guard a.count > 0 else { return b }
    var a = a
    var b = b
    var aIndex = 0
    while b.count > 0 {
        if aIndex >= a.count {
            a.append(contentsOf: b)
        } else {
            if b[0] < a[aIndex] {
                let item = b.removeFirst()
                a.insert(item, at: aIndex)
            } else {
                aIndex += 1
            }
        }
    }
    return a
}

sortedMerge(a: [1,3,5,7,9], b: [2,4,6,8])