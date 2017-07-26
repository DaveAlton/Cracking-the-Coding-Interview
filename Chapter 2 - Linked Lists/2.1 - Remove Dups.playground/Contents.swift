// Write code to remove duplicates from a linked list

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

func removeDups(head: Node) -> Node? {
    var nodesUsed = [Int: Bool]()
    var deDuplicatedHead: Node?
    var currentNode: Node? = head
    var currentDeDuplicatedNode: Node?
    while currentNode != nil {
        if nodesUsed[currentNode!.value] != true {
            if currentDeDuplicatedNode == nil {
                deDuplicatedHead = currentNode!
            }
            nodesUsed[currentNode!.value] = true
            currentDeDuplicatedNode?.next = currentNode
            currentDeDuplicatedNode = currentNode
        }
        currentNode = currentNode!.next
        if let currentNode = currentNode, currentNode == head {
            break
        }
    }
    currentDeDuplicatedNode?.next = nil
    return deDuplicatedHead
}


// 0,1,2
var head = Node(value: 0, next: Node(value: 1, next: Node(value: 1, next: Node(value: 2, next: Node(value: 2)))))
removeDups(head: head)?.printNodes()

// 0,1,2
head = Node(value: 0, next: Node(value: 1, next: Node(value: 2, next: Node(value: 2, next: Node(value: 1)))))
removeDups(head: head)?.printNodes()

// 0
head = Node(value: 0, next: Node(value: 0, next: Node(value: 0, next: Node(value: 0, next: Node(value: 0)))))
removeDups(head: head)?.printNodes()

// 0
head = Node(value: 0)
removeDups(head: head)?.printNodes()

// 0
head = Node(value: 0)
head.next = head
removeDups(head: head)?.printNodes()



// FOLLOW UP:
// How would you solve this problem if a temporary buffer is not allowed?

func removeDupsWithoutBuffer(head: Node) -> Node {
    var node: Node? = head
    while node != nil {
        var runner: Node? = node!.next
        var previous: Node = node!
        while runner != nil {
            if runner!.value == node!.value {
                previous.next = runner!.next
            } else {
                previous = runner!
            }
            runner = runner?.next
            if runner == head {
                break
            }
        }
        node = node?.next
        if node == head {
            break
        }
    }
    return head
}

// 0,1,2
head = Node(value: 0, next: Node(value: 1, next: Node(value: 1, next: Node(value: 2, next: Node(value: 2)))))
removeDupsWithoutBuffer(head: head).printNodes()

// 0,1,2
head = Node(value: 0, next: Node(value: 1, next: Node(value: 2, next: Node(value: 2, next: Node(value: 1)))))
removeDupsWithoutBuffer(head: head).printNodes()

// 0
head = Node(value: 0, next: Node(value: 0, next: Node(value: 0, next: Node(value: 0, next: Node(value: 0)))))
removeDupsWithoutBuffer(head: head).printNodes()

// 0
head = Node(value: 0)
removeDupsWithoutBuffer(head: head).printNodes()

// 0
head = Node(value: 0)
head.next = head
removeDupsWithoutBuffer(head: head).printNodes()
