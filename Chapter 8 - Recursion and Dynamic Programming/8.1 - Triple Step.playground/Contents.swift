// A child is running up a staircase with n steps and can hop either 
// 1 step, 2 steps, or 3 steps at a time. Implement a method to count 
// how many possible ways the child can run up the stairs.

var memo = [Int: Int] ()
func possibleStepCombinations(stairCount: Int, maxSteps: Int) -> Int {
    guard memo[stairCount] == nil else { return memo[stairCount]! }
    guard stairCount > 1 else { return 1 }
    var steps = 0
    for i in 1...min(maxSteps, stairCount) {
        steps += possibleStepCombinations(stairCount: stairCount - i, maxSteps: maxSteps)
    }
    memo[stairCount] = steps
    return steps
}

// [1,1,1]
// [2,1]
// [3]
// [1,2]
possibleStepCombinations(stairCount: 3, maxSteps: 3)

possibleStepCombinations(stairCount: 72, maxSteps: 3)