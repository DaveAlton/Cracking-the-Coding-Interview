// Design an algorithm and write code to find the first common ancestor of two nodes in a binary tree. 
// Avoid storing additional nodes in a data structure. NOTE: This is not necessarily a binary search tree.

class TreeNode: Equatable {
    var value: Int
    var nodes: [TreeNode]
    init(value: Int, nodes: [TreeNode] = []) {
        self.value = value
        self.nodes = nodes
    }
    
    static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return Unmanaged<AnyObject>.passUnretained(lhs as AnyObject).toOpaque() == Unmanaged<AnyObject>.passUnretained(rhs as AnyObject).toOpaque()
    }
}

func firstCommonAncestor(of n1: Int, and n2: Int, in root: TreeNode) -> Int? {
    func tree(_ root: TreeNode, contains value: Int) -> Bool {
        if root.value == value {
            return true
        }
        for node in root.nodes {
            if tree(node, contains: value) {
                return true
            }
        }
        return false
    }
    var commonAncestor = root.value
    if tree(root, contains: n1) && tree(root, contains: n2) {
        for node in root.nodes {
            if tree(node, contains: n1) && tree(node, contains: n2) {
                commonAncestor = firstCommonAncestor(of: n1, and: n2, in: node)!
            }
        }
    } else {
        return nil
    }
    return commonAncestor
}





//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   3
//   Output: 2
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
firstCommonAncestor(of: 3, and: 1, in: tree)


//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   3
//   Output: 5
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
firstCommonAncestor(of: 3, and: 6, in: tree)


//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   3
//   Output: nil
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
firstCommonAncestor(of: 3, and: 7, in: tree)


//             5
//            / \
//           4   6
//          /
//         2
//        / \
//       1   3
//   Output: 2
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
firstCommonAncestor(of: 3, and: 2, in: tree)
