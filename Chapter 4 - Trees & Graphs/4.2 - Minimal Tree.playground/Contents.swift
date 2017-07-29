// Given a sorted (increasing order) array with unique integer elements, 
// write an algo­rithm to create a binary search tree with minimal height.

class Node {
    var value: Int
    var nodes: [Node]
    init(value: Int, nodes: [Node]) {
        self.value = value
        self.nodes = nodes
    }
}

func createBinaryTree(values: [Int]) -> Node? {
    guard values.count > 0 else { return nil }
    if values.count == 1 {
        return Node(value: values.first!, nodes: [])
    } else if values.count <= 3 {
        let root = Node(value: values[1], nodes: [])
        for value in values.enumerated() {
            if value.offset != 2 {
                root.nodes.append(Node(value: value.element, nodes: []))
            }
        }
        return root
    } else {
        let pivot = values.count/2
        let leftValues = Array(values[0..<pivot])
        let rightValues = Array(values[(pivot + 1)..<values.count])
        if let leftNode = createBinaryTree(values: leftValues),
            let rightNode = createBinaryTree(values: rightValues) {
            return Node(value: values[pivot], nodes: [leftNode, rightNode])
        }
    }
    return nil
}

// 2 levels
createBinaryTree(values: [0,1,2])

// 3 levels
createBinaryTree(values: [0,1,2,3])

// 4 levels
createBinaryTree(values: [0,1,2,3,4,5,6,7,8])