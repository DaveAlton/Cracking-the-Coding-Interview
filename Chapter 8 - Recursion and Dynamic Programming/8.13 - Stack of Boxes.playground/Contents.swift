/*
    You have a stack of n boxes, with widths wi, heights hi, and depths di. The boxes cannot be rotated and can only be stacked on top of one another if each box in the stack is strictly larger than the box above it in width, height, and depth. Implement a method to compute the height of the tallest possible stack. The height of a stack is the sum of the heights of each box.
*/

import Foundation

typealias Box = (w: Int, h: Int, d: Int)

func tallestPossibleStack(boxes: [Box], onStack stack: [Box] = [Box]()) -> [Box] {
    func boxSize(_ b1: Box, isLargerThanBox b2: Box) -> Bool {
        return b1.d > b2.d &&
            b1.h > b2.h &&
            b1.w > b2.w
    }
    
    func stackHeight(stack: [Box]) -> Int {
        var height = 0
        for box in stack {
            height += box.h
        }
        return height
    }
    
    guard boxes.count > 0 else { return stack }
    
    var largestStack = [Box]()
    var largestStackHeight = 0
    
    for box in boxes.enumerated() {
        var stack = stack
        if let top = stack.last {
            if boxSize(top, isLargerThanBox: box.element) {
                stack.append(box.element)
            }
        } else {
            stack.append(box.element)
        }
        
        var boxes = boxes
        boxes.remove(at: box.offset)
        stack = tallestPossibleStack(boxes: boxes, onStack: stack)
        
        let currentStackheight = stackHeight(stack: stack)
        if currentStackheight > largestStackHeight {
            largestStack = stack
            largestStackHeight = currentStackheight
        }
    }
    return largestStack
}

tallestPossibleStack(boxes: [
    (w: 1, h: 1, d: 1),
    (w: 2, h: 3, d: 4),
    (w: 4, h: 2, d: 2),
    (w: 5, h: 5, d: 5),
    (w: 7, h: 3, d: 1),
    (w: 100, h: 1, d: 100),
    (w: 2, h: 2, d: 2)
    ])

