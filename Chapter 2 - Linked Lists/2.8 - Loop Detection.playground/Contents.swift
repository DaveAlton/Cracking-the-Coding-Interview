// Given a circular linked list, implement an algorithm that returns the node at the beginning of the loop.
//
// DEFINITION:
// Circular Linked List: A (corrupt) linked list in which a node's next pointer points to an earlier node, 
//                       so as to make a loop in the linked list
// 
// EXAMPLE:
// Input: A -> B -> C -> D -> E -> C [The same C from earlier]
// Output: C

class Node: Equatable {
    var value: Int
    var next: Node?
    var reference: UnsafeMutableRawPointer {
        return Unmanaged<AnyObject>.passUnretained(self as AnyObject).toOpaque()
    }
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    func printNodes() {
        var currentNode: Node? = self
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
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.reference == rhs.reference
    }
    
}

func nodeAtLoop(head: Node) -> Node? {
    var memo = [UnsafeMutableRawPointer: Bool]()
    var currentNode: Node? = head
    while currentNode != nil {
        if memo[currentNode!.reference] == true {
            return currentNode
        } else {
            memo[currentNode!.reference] = true
        }
        currentNode = currentNode!.next
    }
    return nil
}

// node with value of 1
var head = Node(value: 0, next: Node(value: 1, next: Node(value: 2, next: Node(value: 3))))
head.next?.next?.next?.next = head.next
nodeAtLoop(head: head)?.value

// node with value of 0
head = Node(value: 0, next: Node(value: 1, next: Node(value: 2, next: Node(value: 3))))
head.next?.next?.next?.next = head
nodeAtLoop(head: head)?.value

// nil
head = Node(value: 0, next: Node(value: 1, next: Node(value: 2, next: Node(value: 3))))
nodeAtLoop(head: head)?.value