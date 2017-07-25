// Implement an algorithm to find the Kth to last element of a singly linked list.

class Node: Equatable {
    var id: Int
    var next: Node?
    
    init(id: Int, next: Node? = nil) {
        self.id = id
        self.next = next
    }
    
    func printNodes() {
        var currentNode: Node? = self
        var nodeString = ""
        while currentNode != nil {
            nodeString += "\(currentNode!.id)"
            currentNode = currentNode!.next
            if currentNode == self {
                break
            }
        }
        print(nodeString)
    }
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return Unmanaged<AnyObject>.passUnretained(lhs as AnyObject).toOpaque() == Unmanaged<AnyObject>.passUnretained(rhs as AnyObject).toOpaque()
    }
    
}

func deleteMiddleNode(head: Node) -> Node? {
    var runner: Node? = head.next?.next
    var node: Node? = head
    var previousNode = head
    while node != nil {
        if runner == nil || runner == head {
            if previousNode == node {
                return nil
            }
            previousNode.next = node?.next
            return head
        }
        runner = runner?.next?.next
        previousNode = node!
        node = node?.next
        if node == head {
            return nil
        }
    }
    return head
}

// 0122
var head = Node(id: 0, next: Node(id: 1, next: Node(id: 9, next: Node(id: 2, next: Node(id: 2)))))
deleteMiddleNode(head: head)?.printNodes()

// 012 or 022
head = Node(id: 0, next: Node(id: 1, next: Node(id: 2, next: Node(id: 2))))
deleteMiddleNode(head: head)?.printNodes()

// 0000
head = Node(id: 0, next: Node(id: 0, next: Node(id: 0, next: Node(id: 0, next: Node(id: 0)))))
deleteMiddleNode(head: head)?.printNodes()

// nil
head = Node(id: 0)
deleteMiddleNode(head: head)?.printNodes()

// nil
head = Node(id: 0)
head.next = head
deleteMiddleNode(head: head)?.printNodes()
