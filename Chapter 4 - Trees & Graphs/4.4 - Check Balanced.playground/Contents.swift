// Implement a function to check if a binary tree is balanced. For the purposes of this question, 
// a balanced tree is defined to be a tree such that the heights of the two subtrees of any node
// never differ by more than one.

class TreeNode {
    var value: Int
    var nodes: [TreeNode]
    init(value: Int, nodes: [TreeNode] = []) {
        self.value = value
        self.nodes = nodes
    }
}

func isBalanced(tree: TreeNode) -> Bool {
    func depths(in tree: TreeNode, currentDepth: Int = 0) -> [Int] {
        guard tree.nodes.count > 0 else { return [0] }
        var nodeDepths = [Int]()
        for node in tree.nodes {
            let treeDepths = depths(in: node)
            for depth in treeDepths {
                nodeDepths.append((currentDepth + 1 + depth))
            }
        }
        return nodeDepths
    }
    var shortest = Int.max
    var longest = Int.min
    let treeDepths = depths(in: tree)
    for depth in treeDepths {
        if depth < shortest {
            shortest = depth
        }
        if depth > longest {
            longest = depth
        }
    }
    return longest - shortest <= 1
}



//             0
//            / \
//           0   0
//          /
//         0
//        / \
//       0   1
// FALSE
var tree = TreeNode(value: 0, nodes:
    [
        TreeNode(value: 0, nodes:
            [
                TreeNode(value: 0, nodes:
                    [
                        TreeNode(value: 0),
                        TreeNode(value: 1)
                    ]
                )
            ]
        ),
        TreeNode(value: 0)
    ]
)
isBalanced(tree: tree)



//             0
//            / \
//           1   2
// TRUE
tree = TreeNode(value: 0, nodes:
    [
        TreeNode(value: 1),
        TreeNode(value: 2)
    ]
)
isBalanced(tree: tree)


//             0
//            / \
//           1   2
//          / \
//         3   4
// TRUE
tree = TreeNode(value: 0, nodes:
    [
        TreeNode(value: 1, nodes:
            [
                TreeNode(value: 3),
                TreeNode(value: 4)
            ]
        ),
        TreeNode(value: 2)
    ]
)
isBalanced(tree: tree)
