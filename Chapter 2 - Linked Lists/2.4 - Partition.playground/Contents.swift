// Write code to partition a linked list around a value x, such that all nodes less than x 
// come before all nodes greater than or equal to x. If x is contained within the list,
// the values of x only need to be after the values less than x (see below). 
// The partition element x can appear anywhere in the "right partition", 
// it does not need to appear between the left and right partitions.
//
// EXAMPLE
// Input: 3->5->8->5->10->2->1 [partition: 5]
// Output: 3->1->2->10->5->5->8

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

func partition(head: Node, partition: Int) -> Node {
    var node: Node? = head
    var leftPartitionHead: Node?
    var leftPartition: Node?
    var rightPartitionHead: Node?
    var rightPartition: Node?
    while node != nil {
        if node!.value < partition {
            if leftPartition != nil {
                leftPartition?.next = node
                leftPartition = node
            } else {
                leftPartitionHead = node
                leftPartition = node
            }
        } else {
            if rightPartition != nil {
                rightPartition?.next = node
                rightPartition = node
            } else {
                rightPartitionHead = node
                rightPartition = node
            }
        }
        node = node?.next
        if node == head {
            break
        }
    }
    rightPartition?.next = nil
    if leftPartitionHead != nil {
        leftPartition?.next = rightPartitionHead
        return leftPartitionHead!
    } else {
        return rightPartitionHead!
    }
    
}

// 01229
var head = Node(value: 0, next: Node(value: 1, next: Node(value: 9, next: Node(value: 2, next: Node(value: 2)))))
partition(head: head, partition: 3).printNodes()

// 32158510
head = Node(value: 3, next: Node(value: 5, next: Node(value: 8, next: Node(value: 5, next: Node(value: 10, next: Node(value: 2, next: Node(value: 1)))))))
partition(head: head, partition: 5).printNodes()

// 0122
head = Node(value: 0, next: Node(value: 1, next: Node(value: 2, next: Node(value: 2))))
partition(head: head, partition: 1).printNodes()

// 0000
head = Node(value: 0, next: Node(value: 0, next: Node(value: 0, next: Node(value: 0, next: Node(value: 0)))))
partition(head: head, partition: 0).printNodes()

// 0
head = Node(value: 0)
partition(head: head, partition: 0).printNodes()

// 0
head = Node(value: 0)
head.next = head
partition(head: head, partition: 0).printNodes()
