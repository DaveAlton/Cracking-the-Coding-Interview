// Implement a function to check if a binary tree is a binary search tree.

class TreeNode {
    var value: Int
    var nodes: [TreeNode]
    init(value: Int, nodes: [TreeNode] = []) {
        self.value = value
        self.nodes = nodes
    }
}

func validateBinarySearchTree(tree: TreeNode) -> Bool {
    func nodesAreBetween(node: TreeNode, min: Int, max: Int) -> Bool {
        print("\(min)<\(node.value)<\(max)")
        guard node.value >= min && node.value <= max else { return false }
        guard node.nodes.count > 0 else { return true }
        var nodesAreBalanced = true
        if node.nodes.count >= 1,
            let leftNode = node.nodes.first,
            !nodesAreBetween(node: leftNode, min: min, max: node.value) {
            nodesAreBalanced = false
        }
        if node.nodes.count == 2,
            let rightNode = node.nodes.last,
            !nodesAreBetween(node: rightNode, min: node.value, max: max) {
            nodesAreBalanced = false
        }
        return nodesAreBalanced
    }
    return nodesAreBetween(node: tree, min: Int.min, max: Int.max)
}


//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   3
// TRUE
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
validateBinarySearchTree(tree: tree)


//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   4
// TRUE
tree = TreeNode(value: 5, nodes:
    [
        TreeNode(value: 4, nodes:
            [
                TreeNode(value: 2, nodes:
                    [
                        TreeNode(value: 1),
                        TreeNode(value: 4)
                    ]
                )
            ]
        ),
        TreeNode(value: 6)
    ]
)
validateBinarySearchTree(tree: tree)


//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   5
// TRUE
tree = TreeNode(value: 5, nodes:
    [
        TreeNode(value: 4, nodes:
            [
                TreeNode(value: 2, nodes:
                    [
                        TreeNode(value: 1),
                        TreeNode(value: 5)
                    ]
                )
            ]
        ),
        TreeNode(value: 6)
    ]
)
validateBinarySearchTree(tree: tree)
