// Write a method to return all subsets of a set.

func subsets(_ array: [Any]) -> [[Any]] {
    guard array.count > 0 else { return [[]] }
    guard array.count > 1 else { return [[], array] }
    var subsetArray = [[Any]]()
    for i in 0..<array.count {
        subsetArray += [Array(array[0...i])]
    }
    return subsetArray + subsets(Array(array[1..<array.count]))
}

subsets([])
subsets([0])
subsets([0,1])
subsets([0,1,2])
subsets([0,1,2,3,4,5,6,7,8,9])