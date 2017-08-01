// You are implementing a binary tree class from scratch which, in addition to insert, 
// find, and delete, has a method getRandomNode() which returns a random node from the tree. 
// All nodes should be equally likely to be chosen. Design and implement an algorithm for 
// getRandomNode, and explain how you would implement the rest of the methods.
//
// The issue with randomness through a binary tree is knowing how many nodes there are in the tree.
// One option is that we can have the algorithm choose a number between 0 and 2. 0 choosing the root node,
// 1 choosing the left node, and 2 choosing the right node. If the number is 1 or 2, the algorithm acts
// recursively on that node. The issue with this, as stated above, is that if the tree is 100 nodes deep, 
// there is very little chance that we will ever get to the bottom. It wouldn't be truly random.
// Another option is to output all nodes into an array and choose one element at random. This would be truly
// random, but the issue again is if the tree is 100 nodes deep. We don't want to keep trillions of nodes in an array.
// Lastly, we can output a random number and traverse through the array in a loop. Much like a pre-determined
// duck-duck-goose game, we can loop through the tree until we hit our random number (goose). The issue with this is that
// if we assume the array can get very very large, we will be choosing a number in the trillions. Then, if we give a tree
// that is only 3 nodes, we wastefully loop through too many times.
// The best solution would be to change our first option and extend TreeNode. We can add a count variable of how many nodes 
// it contains to the left and to the right. Then, initially traverse through the tree, calculating the correct counts, and
// generate a number that correctly reflects the depth of the tree (rather than 1/3). This would also give us only 0(N) runtime.
// When we delete and insert, we have to also update these counts.

import Foundation

class TreeNode: Equatable {
    var value: Int
    var nodes: [TreeNode]
    var leftNodeCount: Int?
    var rightNodeCount: Int?
    var totalNodeCount: Int? {
        if let left = leftNodeCount, let right = rightNodeCount {
            return left + right + 1
        }
        return nil
    }
    private var address: UnsafeMutableRawPointer {
        return Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque()
    }
    init(value: Int, nodes: [TreeNode] = []) {
        self.value = value
        self.nodes = nodes
    }
    
    static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.address == rhs.address
    }
}

func getRandomNode(in root: TreeNode, withNodeCount count: Int? = nil) -> TreeNode {
    func fillNodeCount(for root: TreeNode) -> Int {
        root.leftNodeCount = root.nodes.count >= 1 ? fillNodeCount(for: root.nodes[0]) : 0
        root.rightNodeCount = root.nodes.count == 2 ? fillNodeCount(for: root.nodes[1]) : 0
        return root.totalNodeCount!
    }
    if root.totalNodeCount == nil {
        _ = fillNodeCount(for: root)
    }
    let randomNumber = arc4random_uniform(UInt32(root.totalNodeCount!))
    if randomNumber == 0 {
        return root
    } else {
        let randomIndex = Int(arc4random_uniform(UInt32(root.nodes.count)))
        return getRandomNode(in: root.nodes[randomIndex])
    }
}

// To test the effective randomness of this algorithm, the best idea is to run it many many times (say, 100 x the node count),
// keeping track of the random node values it chooses in a dictionary. The closer the output is to the below example, the better.
// [
//    1: 100,
//    2: 100,
//    3: 100,
//    4: 100,
//    5: 100,
//    6: 100,
//    7: 100
// ]

//      4
//    /   \
//   2     6
//  / \   / \
// 1   3 5   7
var tree = TreeNode(value: 4, nodes:
    [
        TreeNode(value: 2, nodes:
            [
                TreeNode(value: 1),
                TreeNode(value: 3)
            ]
        ),
        TreeNode(value: 6, nodes:
            [
                TreeNode(value: 5),
                TreeNode(value: 7)
            ]
        )
    ]
)

var values = [Int: Int]()
for _ in 0..<700 {
    var value = getRandomNode(in: tree).value
    values[value] = (values[value] ?? 0) + 1
}
print(values)
