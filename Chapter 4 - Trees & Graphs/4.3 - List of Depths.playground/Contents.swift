// Given a binary tree, design an algorithm which creates a linked list of all the nodes 
// at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).

class ListNode: Equatable {
    var value: Int
    var next: ListNode?
    
    init(value: Int, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
    
    func printNodes() {
        var currentNode: ListNode? = self
        var nodeString = ""
        while currentNode != nil {
            nodeString += "\(currentNode!.value)"
            currentNode = currentNode!.next
            if currentNode == self {
                break
            }
        }
        print(nodeString)
    }
    
    static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return Unmanaged<AnyObject>.passUnretained(lhs as AnyObject).toOpaque() == Unmanaged<AnyObject>.passUnretained(rhs as AnyObject).toOpaque()
    }
}

class TreeNode {
    var value: Int
    var nodes: [TreeNode]
    init(value: Int, nodes: [TreeNode]? = nil) {
        self.value = value
        self.nodes = nodes ?? []
    }
}

func convertToLinkedLists(root: TreeNode) -> [ListNode] {
    guard root.nodes.count > 0 else { return [ListNode(value: root.value)] }
    var lists = [ListNode]()
    for node in root.nodes {
        for list in convertToLinkedLists(root: node) {
            lists.append(ListNode(value: root.value, next: list))
        }
    }
    return lists
}


//             0
//            / \
//           0   0
//          /
//         0
//        / \
//       0   1
// [[0,0,0,0],[0,0,0,1],[0,0]]
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
var lists = convertToLinkedLists(root: tree)
lists.forEach({ $0.printNodes() })


//             0
//            / \
//           0   0
//          /
//         0
//        / \
//       0   1
// [[0,0,0,0],[0,0,0,0],[0,0]]
tree = TreeNode(value: 0, nodes:
    [
        TreeNode(value: 0, nodes:
            [
                TreeNode(value: 0, nodes:
                    [
                        TreeNode(value: 0),
                        TreeNode(value: 0)
                    ]
                )
            ]
        ),
        TreeNode(value: 0)
    ]
)
lists = convertToLinkedLists(root: tree)
lists.forEach({ $0.printNodes() })


//             0
//            / \
//           1   2
// [[0,1],[0,2]]
tree = TreeNode(value: 0, nodes:
    [
        TreeNode(value: 1),
        TreeNode(value: 2)
    ]
)
lists = convertToLinkedLists(root: tree)
lists.forEach({ $0.printNodes() })