// Given two strings, check if one is a permutation of the other.

func isPermutation(a: String, b: String) -> Bool {
    let a = a.characters.flatMap({ $0 }) // O(N)
    let b = b.characters.flatMap({ $0 }) // O(N)
    return a.sorted() == b.sorted()      // O(N)
}

// TRUE
isPermutation(a: "abc", b: "abc")

// TRUE
isPermutation(a: "abc", b: "cba")

// FALSE
isPermutation(a: "abc", b: "aaa")

// TRUE
isPermutation(a: "", b: "")

// TRUE
isPermutation(a: "a", b: "a")