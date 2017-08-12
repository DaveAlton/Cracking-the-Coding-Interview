/*
 Imagine you are reading in a stream of integers. Periodically, you wish to be able to look up the rank of a number x (the number of values less than or equal to x). implement the data structures and algorithms to support these operations. That is, implement the method track(int x), which is called when each number is generated, and the method getRankOfNumber(int x), which returns the number of values less than or equal to x (not including x itself).
 
 EXAMPLE
 Stream (in order of appearance): 5, 1, 4, 4, 5, 9, 7, 13, 3
 getRankOfNumber(l) = 0
 getRankOfNumber(3) = 1 
 getRankOfNumber(4) = 3
*/

import Foundation

class Stream {
    class StreamTree {
        var root: StreamTreeNode?
        
        class StreamTreeNode {
            var value: Int
            var count = 1
            var leftNodeCount = 0
            var leftNode: StreamTreeNode?
            var rightNodeCount = 0
            var rightNode: StreamTreeNode?
            var childCount: Int {
                return leftNodeCount + rightNodeCount
            }
            
            init(value: Int) {
                self.value = value
            }
            
            func add(value: Int) {
                if value == self.value {
                    count += 1
                } else if value < self.value {
                    leftNodeCount += 1
                    if leftNode == nil {
                        leftNode = StreamTreeNode(value: value)
                    } else {
                        leftNode?.add(value: value)
                    }
                } else {
                    rightNodeCount += 1
                    if rightNode == nil {
                        rightNode = StreamTreeNode(value: value)
                    } else {
                        rightNode?.add(value: value)
                    }
                }
            }
            
            func rank(ofValue value: Int) -> Int? {
                guard value != self.value else { return leftNodeCount + count - 1}
                if value < self.value {
                    return leftNode?.rank(ofValue: value)
                } else {
                    if let rankInRightNode = rightNode?.rank(ofValue: value) {
                        print(rankInRightNode)
                        return leftNodeCount + rankInRightNode + count
                    }
                }
                return nil
            }
        }
        
        func add(x: Int) {
            if root == nil {
                root = StreamTreeNode(value: x)
            } else {
                root?.add(value: x)
            }
        }
        
        func rank(ofValue value: Int) -> Int? {
            return root?.rank(ofValue: value)
        }
    }

    private var array: [Int]
    var streamTree = StreamTree()
    
    init(_ array: [Int]) {
        self.array = array
    }
    
    func stream() {
        for x in array {
            track(x: x)
        }
    }
    
    private func track(x: Int) {
        streamTree.add(x: x)
    }
    
    func getRankOfNumber(x: Int) -> Int? {
        return streamTree.rank(ofValue: x)
    }
}

//              5(2)
//            /    \
//          1        9
//           \      / \
//            4(2) 7  13
//           /
//          3
var stream = Stream([5, 1, 4, 4, 5, 9, 7, 13, 3])
stream.stream()
let tree = stream.streamTree
stream.getRankOfNumber(x: 1)
stream.getRankOfNumber(x: 3)
stream.getRankOfNumber(x: 4)
stream.getRankOfNumber(x: 5)
stream.getRankOfNumber(x: 7)
stream.getRankOfNumber(x: 9)
stream.getRankOfNumber(x: 13)
