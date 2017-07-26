// Describe how you could use a single array to implement three stacks

class Stack {
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

extension Array {
    func divideInto(numberOfStacks: Int) -> [Stack] {
        let pivot = Double(Double(self.count) / Double(numberOfStacks)).rounded(.up)
        var stackIndex: Int?
        var stacks = [Stack]()
        for item in self.enumerated() {
            // if the modulo of the offset/pivot is 0, then it's time to create another stack
            if Double(item.offset).remainder(dividingBy: Double(pivot)) == 0 {
                if stackIndex == nil {
                    stackIndex = 0
                } else {
                    stackIndex! += 1
                }
                stacks.append(Stack())
            }
            stacks[stackIndex!].push(value: item.element)
        }
        return stacks
    }
}

// [ 2 1 0 ],[ 5 4 3 ],[ 7 6 ]
[0,1,2,3,4,5,6,7].divideInto(numberOfStacks: 3).forEach({ $0.printValues() })

// [ 2 1 0 ],[ 5 4 3 ],[ 8 7 6 ]
[0,1,2,3,4,5,6,7,8].divideInto(numberOfStacks: 3).forEach({ $0.printValues() })

// [ 0 ],[ 1 ]
[0,1].divideInto(numberOfStacks: 3).forEach({ $0.printValues() })
