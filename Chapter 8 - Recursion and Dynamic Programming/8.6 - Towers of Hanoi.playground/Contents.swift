/*
 In the classic problem of the towers of Hanoi, you have 3 towers and N disks of different sizes which can slide onto any tower. The puzzle starts with disks sorted in ascending order of size from top to bottom (i.e., each disk sits on top of an even larger one).You have the following constraints:
 (1) Only one disk can be moved at a time.
 (2) A disk is slid off the top of one tower onto another tower.
 (3) A disk cannot be placed on top of a smaller disk.
 Write a program to move the disks from the first tower to the last using stacks.
*/


var attempts = [String: Bool]()
func towersOfHanoi(towers: [[Int]]) -> [[Int]]? {
    guard towers.filter({ $0.count > 0 }).count > 1 || towers.last!.count == 0 else { return towers }
    for i in 0..<towers.count {
        for j in 0..<towers.count {
            if let disk = towers[i].last {
                if j != i && (towers[j].last ?? Int.max) > disk {
                    var towers = towers
                    towers[i].removeLast()
                    towers[j].append(disk)
                    if attempts[towers.description] != true {
                        attempts[towers.description] = true
                        if let towers = towersOfHanoi(towers: towers) {
                            return towers
                        }
                    }
                }
            }
        }
    }
    return nil
}

towersOfHanoi(towers: [[2,1],[],[]])

towersOfHanoi(towers: [[3,2,1],[],[]])

towersOfHanoi(towers: [[4,3,2,1],[],[]])

towersOfHanoi(towers: [[5,4,3,2,1],[],[]])

towersOfHanoi(towers: [[6,5,4,3,2,1],[],[]])

towersOfHanoi(towers: [[7,6,5,4,3,2,1],[],[]])

towersOfHanoi(towers: [[8,7,6,5,4,3,2,1],[],[]])
