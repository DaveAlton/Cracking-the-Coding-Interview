/*
 Write a recursive function to multiply two positive integers without using the *operator.You can use addition, subtraction, and bit shifting, but you should minimize the number of those operations.
*/

func multiply(n1: Int, n2: Int) -> Int {
    let lesser = min(n1, n2)
    let greater = max(n1, n2)
    guard lesser > 0 else { return 0 }
    guard lesser > 1 else { return greater }
    return greater + multiply(n1: lesser - 1, n2: greater)
}

multiply(n1: 2, n2: 2)

multiply(n1: 5, n2: 4)

multiply(n1: 100, n2: 4)

multiply(n1: 100, n2: 900)