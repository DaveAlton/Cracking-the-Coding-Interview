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

func returnElementOf(head: Node, withRemaining k: Int) -> Node? {
    guard k >= 0 else { return nil }
    var runner: Node? = head
    for _ in 0..<k {
        if runner == nil {
            return nil
        }
        runner = runner?.next
    }
    var node: Node? = head
    while node != nil {
        if runner == nil || runner == head{
            return node
        }
        runner = runner?.next
        node = node?.next
        if node == head {
            return nil
        }
    }
    return nil
}

// 2
var head = Node(id: 0, next: Node(id: 1, next: Node(id: 1, next: Node(id: 2, next: Node(id: 2)))))
returnElementOf(head: head, withRemaining: 2)?.id

// 2
head = Node(id: 0, next: Node(id: 1, next: Node(id: 2, next: Node(id: 2, next: Node(id: 1)))))
returnElementOf(head: head, withRemaining: -1)?.id

// 0
head = Node(id: 0, next: Node(id: 0, next: Node(id: 0, next: Node(id: 0, next: Node(id: 0)))))
returnElementOf(head: head, withRemaining: 2)?.id

// nil
head = Node(id: 0)
returnElementOf(head: head, withRemaining: 16)?.id

// 0
head = Node(id: 0)
head.next = head
returnElementOf(head: head, withRemaining: 0)?.id
