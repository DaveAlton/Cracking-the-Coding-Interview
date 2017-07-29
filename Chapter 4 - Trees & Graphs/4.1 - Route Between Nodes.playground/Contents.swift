// Given a directed graph, design an algorithm to find out whether there is a route between two nodes.

class Node {
    var value: Int
    var nodes: [Node]
    init(value: Int, nodes: [Node]) {
        self.value = value
        self.nodes = nodes
    }
}

func node(_ root: Node, contains value: Int) -> Bool {
    if root.value == value { return true }
    for subnode in root.nodes {
        if node(subnode, contains: value) {
            return true
        }
    }
    return false
}

//             0
//            / \
//           0   0
//          / \   \
//         0   1   0
// TRUE
var graph = Node(value: 0, nodes: [Node(value: 0, nodes: [Node(value: 0, nodes: [Node(value: 0, nodes: []), Node(value: 1, nodes: [])])]), Node(value: 0, nodes: [])])
node(graph, contains: 1)


//             0
//            / \
//           0   0
//          / \   \
//         0   0   0
// FALSE
graph = Node(value: 0, nodes: [Node(value: 0, nodes: [Node(value: 0, nodes: [Node(value: 0, nodes: []), Node(value: 0, nodes: [])])]), Node(value: 0, nodes: [])])
node(graph, contains: 1)