// Given two (singly) linked lists, determine if the two lists intersect. 
// Return the intersecting node. Note that the intersection is defined based on reference, not value. 
// That is, if the Kth node on the first linked list is the exact same node (by reference) 
// as the Jth node on the second linked list, then they are intersecting.

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

func intersectionBetween(l1: Node, l2: Node) -> Node? {
    var memo = [UnsafeMutableRawPointer: Bool]()
    var currentNode: Node? = l1
    while currentNode != nil {
        memo[currentNode!.reference] = true
        currentNode = currentNode!.next
        if currentNode == l1 {
            break
        }
    }
    currentNode = l2
    while currentNode != nil {
        if memo[currentNode!.reference] == true {
            return currentNode
        }
        currentNode = currentNode!.next
        if currentNode == l2 {
            break
        }
    }
    return nil
}

// l1 #3, l2 #3
var l1 = Node(value: 1, next: Node(value: 1, next: Node(value: 2, next: Node(value: 1))))
var l2 = Node(value: 3, next: Node(value: 3, next: l1.next?.next))
intersectionBetween(l1: l1, l2: l2)?.printNodes()

// l1 #1, l2 #1
l1 = Node(value: 1, next: Node(value: 1, next: Node(value: 2, next: Node(value: 1))))
l2 = l1
intersectionBetween(l1: l1, l2: l2)?.printNodes()

// none
l1 = Node(value: 1, next: Node(value: 1, next: Node(value: 2, next: Node(value: 1))))
l2 = Node(value: 1, next: Node(value: 1, next: Node(value: 2, next: Node(value: 1))))
intersectionBetween(l1: l1, l2: l2)?.printNodes()
