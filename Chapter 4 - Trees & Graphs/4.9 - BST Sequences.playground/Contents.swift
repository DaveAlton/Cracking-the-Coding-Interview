// A binary search tree was created by traversing through an array from left to right 
// and inserting each element. Given a binary search tree with distinct elements, 
// print all possible arrays that could have led to this tree.
//
// EXAMPLE
// Input:
//     2
//    / \
//   1   3
// Output: [2, 1, 3], [2, 3, 1]

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

func possibleArraysToCreate(searchTree: TreeNode) -> [[Int]] {
    var arrays = [[searchTree.value]]
    var iteration = 0
    for node in searchTree.nodes {
        for array in arrays {
            for possibleArray in possibleArraysToCreate(searchTree: node).enumerated() {
                if let index = arrays.index(where: { $0 == array }) {
                    arrays.remove(at: index)
                }
                var forwardArray = array
                forwardArray.append(contentsOf: possibleArray.element)
                arrays.append(forwardArray)
                if iteration == 1 {
                    var reversedArray = array
                    reversedArray.insert(contentsOf: possibleArray.element, at: 1)
                    arrays.append(reversedArray)
                }
                iteration += 1
                
            }
        }
    }
    return arrays
}


//     2
//    / \
//   1   3
// [2, 1, 3], [2, 3, 1]
var tree = TreeNode(value: 2, nodes:
    [
        TreeNode(value: 1),
        TreeNode(value: 3)
    ]
)
possibleArraysToCreate(searchTree: tree)

//     2
//    / \
//   1   3
//        \
//         4
// [2, 1, 3, 4], [2, 3, 4, 1]
tree = TreeNode(value: 2, nodes:
    [
        TreeNode(value: 1),
        TreeNode(value: 3, nodes:
            [
                TreeNode(value: 4)
            ]
        )
    ]
)
possibleArraysToCreate(searchTree: tree)


//      4
//    /   \
//   2     6
//  / \   / \
// 1   3 5   7
// [4, 2, 1, 3, 6, 5, 7], [4, 2, 1, 3, 6, 7, 5], [4, 2, 3, 1, 6, 5, 7], [4, 2, 3, 1, 6, 7, 5], [4, 2, 3, 1, 6, 5, 7], [4, 2, 3, 1, 6, 7, 5]
tree = TreeNode(value: 4, nodes:
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
possibleArraysToCreate(searchTree: tree)