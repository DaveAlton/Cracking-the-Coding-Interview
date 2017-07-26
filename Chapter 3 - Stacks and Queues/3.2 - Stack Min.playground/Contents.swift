// How would you describe a stack which, in addition to push and pop, 
// has a function min which returns the minimum element? 
// Push, pop, and min should all have O(1) time.

class IntStack {
    private class Node {
        var value: Int
        var next: Node?
        
        init(value: Int, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    private var top: Node?
    private var minValue: Int?
    
    var isEmpty: Bool {
        return top == nil
    }
    
    func pop() -> Int? {
        if let node = top {
            top = node.next
            return node.value
        }
        return nil
    }
    
    func push(value: Int) {
        let node = Node(value: value, next: top)
        if top == nil {
            top = node
            minValue = value
        } else {
            if let min = minValue, min > value {
                minValue = value
            }
        }
        top = node
    }
    
    func peek() -> Int? {
        return top?.value
    }
    
    func printValues() {
        var valuesString = "[ "
        var node: Node? = top
        while node != nil {
            valuesString += "\(node!.value) "
            node = node?.next
        }
        valuesString += "]"
        print(valuesString)
    }
    
    func min() -> Int? {
        return minValue
    }
}

// 1
var stack = IntStack()
stack.push(value: 3)
stack.push(value: 6)
stack.push(value: 1)
stack.push(value: 9)
stack.push(value: 3)
stack.min()

// 0
stack = IntStack()
stack.push(value: 0)
stack.min()

// -1
stack = IntStack()
stack.push(value: 3)
stack.push(value: 6)
stack.push(value: -1)
stack.push(value: 9)
stack.push(value: 3)
stack.min()

// nil
stack = IntStack()
stack.min()
