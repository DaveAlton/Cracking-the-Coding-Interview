/**
 * An animal shelter holds only dogs and cats, and operates on a strictly
 * "first in, first out" basis. People must adopt either the "oldest"
 * (based on arrival time) of all animals at the shelter, or they can
 * select whether they would prefer a dog or a cat (and will receive
 * the oldest animal of that type). They cannot select which specific
 * animal they would like. Create the data structures to maintain this
 * system and implement operations such as enqueue, dequeueAny, dequeueDog
 * and dequeueCat.You may use the built-in LinkedList data structure.
 */

import Foundation

class Animal {
    var name: String
    var entranceTime: Date
    init(name: String) {
        self.name = name
        self.entranceTime = Date()
    }
}

class Cat: Animal {}
class Dog: Animal {}

class AnimalShelter {
    private class AnimalQueue {
        private class Stack {
            private class Node {
                var value: Animal
                var next: Node?
                
                init(value: Animal, next: Node? = nil) {
                    self.value = value
                    self.next = next
                }
            }
            
            private var top: Node?
            
            var isEmpty: Bool {
                return top == nil
            }
            
            func pop() -> Animal? {
                if let node = top {
                    top = node.next
                    return node.value
                }
                return nil
            }
            
            func push(value: Animal) {
                top = Node(value: value, next: top)
            }
            
            func peek() -> Animal? {
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
        
        func add(value: Animal) {
            stack.push(value: value)
        }
        
        func remove() -> Animal? {
            reversedStack = stack.reversed()
            let value = reversedStack.pop()
            stack = reversedStack.reversed()
            return value
        }
        
        func peek() -> Animal? {
            reversedStack = stack.reversed()
            let value = reversedStack.peek()
            stack = reversedStack.reversed()
            return value
        }
    }
    
    private var catQueue = AnimalQueue()
    private var dogQueue = AnimalQueue()
    
    func enqueue(animal: Animal) {
        if animal is Cat {
            catQueue.add(value: animal)
        } else {
            dogQueue.add(value: animal)
        }
    }
    
    func dequeueAny() -> Animal? {
        if let cat = catQueue.peek(), let dog = dogQueue.peek() {
            if cat.entranceTime < dog.entranceTime {
                return catQueue.remove()
            } else {
                return dogQueue.remove()
            }
        } else if let cat = catQueue.peek() {
            return catQueue.remove()
        } else if let dog = dogQueue.peek() {
            return dogQueue.remove()
        } else {
            return nil
        }
    }
    
    func dequeueCat() -> Animal? {
        return catQueue.remove()
    }
    
    func dequeueDog() -> Animal? {
        return dogQueue.remove()
    }
}

// Frizzy, Orion, Oreo
var shelter = AnimalShelter()
shelter.enqueue(animal: Cat(name: "Frizzy"))
shelter.enqueue(animal: Cat(name: "Oreo"))
shelter.enqueue(animal: Dog(name: "Orion"))
shelter.dequeueCat()
shelter.dequeueDog()
shelter.dequeueCat()

// Frizzy, nil, Oreo
shelter = AnimalShelter()
shelter.enqueue(animal: Cat(name: "Frizzy"))
shelter.enqueue(animal: Cat(name: "Oreo"))
shelter.dequeueCat()
shelter.dequeueDog()
shelter.dequeueCat()

// Frizzy, Oreo
shelter = AnimalShelter()
shelter.enqueue(animal: Cat(name: "Frizzy"))
shelter.enqueue(animal: Dog(name: "Orion"))
shelter.dequeueCat()
shelter.enqueue(animal: Cat(name: "Oreo"))
shelter.dequeueCat()


