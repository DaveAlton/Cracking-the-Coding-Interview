// Imagine a (literal) stack of plates. If the stack gets too high, it might topple.
// Therefore, in real life, we would start a new stack when the previous stack exceeds some threshold.
// Implement a data structure 'SetOfStacks' that mimics this. 'SetOfStacks' should be composed
// of several stacks and should create a new stack once the previous one exceeds capacity.
// SetOfStacks.push() and SetOfStacks.pop() should behave identically to a single stack
// (That is, pop() should return the same values as it would if there were just a single stack).
//
// FOLLOW UP
// Implement a function at pop(atIndex index: Int) which performs a pop on a specific sub-stack.

class SetOfStacks {
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
    
    private var stacks = [Stack]()
    private var stackCounts = [Int: Int]()
    private var currentStackIndex = 0
    private var currentStackCount: Int {
        return stackCounts[currentStackIndex] ?? 0
    }
    private var max: Int
    
    init(max: Int) {
        self.max = max
    }
    
    func push(value: Any) {
        if stacks.count == 0 {
            stacks.append(Stack())
        }
        if currentStackCount == max {
            stacks.append(Stack())
            currentStackIndex += 1
        }
        stacks.last?.push(value: value)
        stackCounts[currentStackIndex] = (stackCounts[currentStackIndex] ?? 0) + 1
    }
    
    func pop(atIndex index: Int) -> Any? {
        if index <= currentStackIndex {
            return stacks[index].pop()
        }
        return nil
    }
}

// Should pop 2
var stacks = SetOfStacks(max: 2)
stacks.push(value: 1)
stacks.push(value: 2)
stacks.push(value: 3)
stacks.pop(atIndex: 0)

// Should pop 3
stacks = SetOfStacks(max: 3)
stacks.push(value: 1)
stacks.push(value: 2)
stacks.push(value: 3)
stacks.pop(atIndex: 0)

// Should pop nil
stacks = SetOfStacks(max: 3)
stacks.push(value: 1)
stacks.push(value: 2)
stacks.push(value: 3)
stacks.pop(atIndex: 1)

