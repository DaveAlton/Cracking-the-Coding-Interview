// Implement an algorithm to find the Kth to last element of a singly linked list.

class Node: Equatable {
    var value: Int
    var next: Node?
    
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
var head = Node(value: 0, next: Node(value: 1, next: Node(value: 9, next: Node(value: 2, next: Node(value: 2)))))
deleteMiddleNode(head: head)?.printNodes()

// 012 or 022
head = Node(value: 0, next: Node(value: 1, next: Node(value: 2, next: Node(value: 2))))
deleteMiddleNode(head: head)?.printNodes()

// 0000
head = Node(value: 0, next: Node(value: 0, next: Node(value: 0, next: Node(value: 0, next: Node(value: 0)))))
deleteMiddleNode(head: head)?.printNodes()

// nil
head = Node(value: 0)
deleteMiddleNode(head: head)?.printNodes()

// nil
head = Node(value: 0)
head.next = head
deleteMiddleNode(head: head)?.printNodes()
