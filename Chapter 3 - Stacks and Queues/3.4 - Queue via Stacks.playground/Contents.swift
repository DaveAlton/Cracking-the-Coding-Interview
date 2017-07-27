// Implement a MyQueue class that implements a queue using two stacks

class MyQueue {
    private class Stack {
        private class Node {
            var value: Any
            var next: Node?
            
            init(value: Any, next: Node? = nil) {
                self.value = value
                self.next = next
            }
        }
        
        private var top: Node?
        
        var isEmpty: Bool {
            return top == nil
        }
        
        func pop() -> Any? {
            if let node = top {
                top = node.next
                return node.value
            }
            return nil
        }
        
        func push(value: Any) {
            top = Node(value: value, next: top)
        }
        
        func peek() -> Any? {
            return top?.value
        }
        
        func reversed() -> Stack {
            let reversedStack = Stack()
            while let value = self.pop() {
                reversedStack.push(value: value)
            }
            return reversedStack
        }
    }
    
    private var stack = Stack()
    private var reversedStack = Stack()
    
    func add(value: Any) {
        stack.push(value: value)
    }
    
    func remove() -> Any? {
        reversedStack = stack.reversed()
        let value = reversedStack.pop()
        stack = reversedStack.reversed()
        return value
    }
}

// 1
var queue = MyQueue()
queue.add(value: 1)
queue.add(value: 2)
queue.add(value: 3)
queue.add(value: 4)
queue.remove()

// nil
queue = MyQueue()
queue.remove()

