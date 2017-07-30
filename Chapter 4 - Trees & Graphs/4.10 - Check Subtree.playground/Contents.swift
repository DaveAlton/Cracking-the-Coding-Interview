// Tl and T2 are two very large binary trees, with Tl much bigger than T2. Create an
// algorithm to determine if T2 is a subtree of Tl.
// A tree T2 is a subtree of Tl if there exists a node n in Tl such that the subtree 
// of n is identical to T2. That is, if you cut off the tree at node n, the two trees 
// would be identical.

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

func tree(_ t1: TreeNode, contains t2: TreeNode) -> Bool {
    func node(withValue value: Int, in tree: TreeNode) -> TreeNode? {
        if tree.value > value && tree.nodes.count > 0 {
            return node(withValue: value, in: tree.nodes[0])
        } else if tree.value < value && tree.nodes.count > 1 {
            return node(withValue: value, in: tree.nodes[1])
        } else if tree.value == value {
            return tree
        }
        return nil
    }
    func tree(_ t1: TreeNode, equals t2: TreeNode) -> Bool {
        var nodesAreEqual = true
        for node in t2.nodes.enumerated() {
            if t1.nodes.count >= node.offset + 1 {
                if !tree(node.element, equals: t1.nodes[node.offset]) {
                    nodesAreEqual = false
                    break
                }
            }
        }
        return nodesAreEqual && t1.value == t2.value
    }
    if let node = node(withValue: t2.value, in: t1) {
        return tree(node, equals: t2)
    } else {
        return false
    }
}


//      4
//    /   \
//   2     6 <-
//  / \   / \
// 1   3 5   7
// TRUE
var t1 = TreeNode(value: 4, nodes:
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
var t2 = TreeNode(value: 6, nodes:
    [
        TreeNode(value: 5),
        TreeNode(value: 7)
    ]
)
tree(t1, contains: t2)


//      4 <-
//    /   \
//   2     6
//  / \   / \
// 1   3 5   7
// TRUE
t1 = TreeNode(value: 4, nodes:
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
t2 = t1
tree(t1, contains: t2)

//      4
//    /   \
//   2     6
//  / \   / \
// 1   3 5   7
// FALSE
t1 = TreeNode(value: 4, nodes:
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
t2 = TreeNode(value: 6, nodes:
    [
        TreeNode(value: 4),
        TreeNode(value: 7)
    ]
)
tree(t1, contains: t2)

//      4
//    /   \
//   2     6
//  / \   / \
// 1   3 5   7 <-
// TRUE
t1 = TreeNode(value: 4, nodes:
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
t2 = TreeNode(value: 7)
tree(t1, contains: t2)
