// You have two numbers represented by a linked list, where each node contains a single digit. 
// The digits are stored in reverse order, such that the 1's digit is at the head of the list.
// Write a function that adds the two numbers and returns the sum of the linked list.
//
// EXAMPLE
// Input: (7->1->6) + (5->9->2). That is 617 + 295
// Output: 2->1->9. That is 912

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

func sumLists(l1: Node, l2: Node) -> Node? {
    let sum = listAsNumber(head: l1) + listAsNumber(head: l2)
    return numberAsList(number: sum)
    
}

func listAsNumber(head: Node) -> Int {
    var number = 0.0
    var multiplier = 0.1
    var node: Node? = head
    
    while node != nil {
        number /= 10
        number += Double(node!.id)
        multiplier *= 10
        
        node = node?.next
        if node == head {
            break
        }
    }
    return Int(number * multiplier)
}

func numberAsList(number: Int) -> Node? {
    guard number > 0 else { return Node(id: 0) }
    var head: Node?
    var currentNode: Node?
    var remainder = number
    while remainder > 0 {
        let lastDigit = Int(Double(remainder).truncatingRemainder(dividingBy: 10))
        if currentNode == nil {
            head = Node(id: lastDigit)
            currentNode = head
        } else {
            currentNode?.next = Node(id: lastDigit)
            currentNode = currentNode?.next
        }
        remainder = (remainder - lastDigit)/10
    }
    return head
}

// 22910 + 89 = 22999 -> (9->9->9->2->2)
var l1 = Node(id: 0, next: Node(id: 1, next: Node(id: 9, next: Node(id: 2, next: Node(id: 2)))))
var l2 = Node(id: 9, next: Node(id: 8))
sumLists(l1: l1, l2: l2)?.printNodes()

// 1215853 + 89 = 1215942 -> (2->4->9->5->1->2->1)
l1 = Node(id: 3, next: Node(id: 5, next: Node(id: 8, next: Node(id: 5, next: Node(id: 1, next: Node(id: 2, next: Node(id: 1)))))))
l2 = Node(id: 9, next: Node(id: 8))
sumLists(l1: l1, l2: l2)?.printNodes()

// 0 + 0 = 0 -> (0)
l1 = Node(id: 0)
l2 = Node(id: 0)
sumLists(l1: l1, l2: l2)?.printNodes()
