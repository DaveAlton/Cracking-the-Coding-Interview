// Implement a function to tell if a linked list is a palindrome.

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

func isPalindrome(head: Node) -> Bool {
    var rightHalf = [Int]()
    var currentNode: Node? = head
    var runner: Node? = head.next?.next
    while currentNode != nil {
        if runner == nil {
            rightHalf.append(currentNode!.value)
        }
        runner = runner?.next?.next
        currentNode = currentNode?.next
        if currentNode == head {
            return false
        }
    }
    currentNode = head
    while currentNode != nil {
        if rightHalf.count == 0 {
            break
        }
        if rightHalf.count > 0 {
            if currentNode!.value != rightHalf.removeLast() {
                return false
            }
        }
        currentNode = currentNode?.next
        if currentNode == head {
            return false
        }
    }
    return rightHalf.count <= 1
}

var head = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 2, next: Node(value: 1)))))
isPalindrome(head: head)

head = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 3, next: Node(value: 1)))))
isPalindrome(head: head)

head = Node(value: 0)
isPalindrome(head: head)
