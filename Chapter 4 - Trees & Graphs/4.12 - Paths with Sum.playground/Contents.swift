// You are given a binary tree in which each node contains an integer value 
// (which might be positive or negative). Design an algorithm to count the 
// number of paths that sum to a given value. The path does not need to 
// start or end at the root or a leaf, but it must go downwards (traveling 
// only from parent nodes to child nodes).

import Foundation

class TreeNode: Equatable {
    var value: Int
    var nodes: [TreeNode]
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

// This method runs through the tree and keeps going until it counts to the
// required sum (or beyond). It does this for each node too. This means that
// each node is doing a function that is O(log(N)). This means that the speed
// is O(N*log(N))

func numberOfPathsInTree(_ root: TreeNode, whichSumTo sum: Int) -> Int {
    if root.value == sum {
        return 1
    } else if root.value > sum {
        return 0
    }
    var count = 0
    for node in root.nodes {
        count += numberOfPathsInTree(node, whichSumTo: sum - root.value)
        count += numberOfPathsInTree(node, whichSumTo: sum)
    }
    return count
}


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

// 2
numberOfPathsInTree(tree, whichSumTo: 3)
// 1
numberOfPathsInTree(tree, whichSumTo: 1)

//      1
//    /   \
//   1     1
//  / \   / \
// 1   1 1   1
tree = TreeNode(value: 1, nodes:
    [
        TreeNode(value: 1, nodes:
            [
                TreeNode(value: 1),
                TreeNode(value: 1)
            ]
        ),
        TreeNode(value: 1, nodes:
            [
                TreeNode(value: 1),
                TreeNode(value: 1)
            ]
        )
    ]
)

// 6
numberOfPathsInTree(tree, whichSumTo: 2)
// 4
numberOfPathsInTree(tree, whichSumTo: 3)
