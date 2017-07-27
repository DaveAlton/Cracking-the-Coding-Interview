// Write a program to sort a stack such that the smallest items are on top.
// You can use an additional temporary stack, but you may not copy the elements 
// into any other data structure (such as an array). The stack supports the following operations: 
// push, pop, peek, and isEmpty.

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
}

// Basically a bubble sort
func sort(stack: IntStack) -> IntStack{
    while !isSorted(stack: stack) {
        if let value = stack.pop() {
            sort(stack: stack)
            if let next = stack.pop() {
                if value > next {
                    stack.push(value: value)
                    stack.push(value: next)
                } else {
                    stack.push(value: next)
                    stack.push(value: value)
                }
            } else {
                stack.push(value: value)
            }
        }
    }
    return stack
}

func isSorted(stack: IntStack) -> Bool {
    var previous: Int?
    var tempStack = IntStack()
    var isSorted = true
    while let value = stack.pop() {
        if let previous = previous, previous > value {
            isSorted = false
        }
        tempStack.push(value: value)
        previous = value
    }
    while let value = tempStack.pop() {
        stack.push(value: value)
    }
    return isSorted
}

// 1,2,3,4
var stack = IntStack()
stack.push(value: 1)
stack.push(value: 2)
stack.push(value: 3)
stack.push(value: 4)
sort(stack: stack)
stack.printValues()

// 1,2,3,4
stack = IntStack()
stack.push(value: 1)
stack.push(value: 4)
stack.push(value: 3)
stack.push(value: 2)
sort(stack: stack)
stack.printValues()

// -1,0,1
stack = IntStack()
stack.push(value: -1)
stack.push(value: 0)
stack.push(value: 1)
sort(stack: stack)
stack.printValues()

// empty
stack = IntStack()
sort(stack: stack)
stack.printValues()

