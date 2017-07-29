// Write an algorithm to find the "next" node (i.e., in-order successor) of a given node in a binary search tree. You may assume that each node has a link to its parent.

class TreeNode {
    var value: Int
    var nodes: [TreeNode]
    init(value: Int, nodes: [TreeNode] = []) {
        self.value = value
        self.nodes = nodes
    }
}

func inOrderSuccessor(tree: TreeNode, ofNodeWithValue value: Int) -> TreeNode? {
    if tree.value == value, tree.nodes.count == 2 {
        return tree.nodes[1]
    }
    if let node = value < tree.value ? tree.nodes.first : tree.nodes.last {
        if let successor = inOrderSuccessor(tree: node, ofNodeWithValue: value) {
            return successor
        } else {
            return tree.value > value ? tree : nil
        }
    }
    return nil
}


//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   3
// Output: 3
var tree = TreeNode(value: 5, nodes:
    [
        TreeNode(value: 4, nodes:
            [
                TreeNode(value: 2, nodes:
                    [
                        TreeNode(value: 1),
                        TreeNode(value: 3)
                    ]
                )
            ]
        ),
        TreeNode(value: 6)
    ]
)
inOrderSuccessor(tree: tree, ofNodeWithValue: 2)?.value


//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   3
// Output: 4
tree = TreeNode(value: 5, nodes:
    [
        TreeNode(value: 4, nodes:
            [
                TreeNode(value: 2, nodes:
                    [
                        TreeNode(value: 1),
                        TreeNode(value: 3)
                    ]
                )
            ]
        ),
        TreeNode(value: 6)
    ]
)
inOrderSuccessor(tree: tree, ofNodeWithValue: 3)?.value


//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   3
// Output: nil
tree = TreeNode(value: 5, nodes:
    [
        TreeNode(value: 4, nodes:
            [
                TreeNode(value: 2, nodes:
                    [
                        TreeNode(value: 1),
                        TreeNode(value: 3)
                    ]
                )
            ]
        ),
        TreeNode(value: 6)
    ]
)
inOrderSuccessor(tree: tree, ofNodeWithValue: 6)?.value


//             5
//            / \
//           4   6
//          /
//         2
//        /
//       1
// Output: 4
tree = TreeNode(value: 5, nodes:
    [
        TreeNode(value: 4, nodes:
            [
                TreeNode(value: 2, nodes:
                    [
                        TreeNode(value: 1)
                    ]
                )
            ]
        ),
        TreeNode(value: 6)
    ]
)
inOrderSuccessor(tree: tree, ofNodeWithValue: 2)?.value



//             5
//            / \
//           4   6
//          /
//         2
//        /
//       1
// Output: 4
tree = TreeNode(value: 5, nodes:
    [
        TreeNode(value: 4, nodes:
            [
                TreeNode(value: 2, nodes:
                    [
                        TreeNode(value: 1)
                    ]
                )
            ]
        ),
        TreeNode(value: 6)
    ]
)
inOrderSuccessor(tree: tree, ofNodeWithValue: 4)?.value

