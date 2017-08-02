/*
 Implement the "paint fill" function that one might see on many image editing programs. That is, given a screen (represented by a two-dimensional array of colors), a point, and a new color, fill in the surrounding area until the color changes from the original color.
*/

import Foundation

func paintFill(canvas: [[Int]], withColor color: Int, fromPoint point: (row: Int, col: Int), fromColor: Int? = nil) -> [[Int]] {
    func pointIsWithinCanvas(_ point: (row: Int, col: Int), canvas: [[Int]]) -> Bool {
        return point.row >= 0 &&
            point.col >= 0 &&
            point.row < canvas.count &&
            point.col < canvas[point.row].count
    }
    guard canvas[point.row][point.col] != color else { return canvas }
    
    var originalColor = fromColor ?? canvas[point.row][point.col]
    var canvas = canvas
    canvas[point.row][point.col] = color
    
    let rowAdjustments = [-1,1,0,0]
    let colAdjustments = [0,0,-1,1]
    for i in 0..<rowAdjustments.count {
        let rowAdjustment = rowAdjustments[i]
        let colAdjustment = colAdjustments[i]
        let adjustedPoint = (row: point.row + rowAdjustment, col: point.col + colAdjustment)
        if pointIsWithinCanvas(adjustedPoint, canvas: canvas) &&
            canvas[adjustedPoint.row][adjustedPoint.col] != color &&
            canvas[adjustedPoint.row][adjustedPoint.col] == originalColor {
            canvas = paintFill(canvas: canvas, withColor: color, fromPoint: adjustedPoint, fromColor: originalColor)
        }
    }
    
    return canvas
}

var canvas = [
    [0,0,0,0,0,0,0],
    [0,1,1,1,1,1,0],
    [0,1,0,0,0,1,0],
    [0,1,0,0,0,1,0],
    [0,1,0,0,0,1,0],
    [0,1,1,1,1,1,0],
    [0,0,0,0,0,0,0]
]
canvas = paintFill(canvas: canvas, withColor: 2, fromPoint: (row: 3, col: 3))
print(canvas)

canvas = paintFill(canvas: canvas, withColor: 2, fromPoint: (row: 1, col: 1))
print(canvas)

canvas = paintFill(canvas: canvas, withColor: 0, fromPoint: (row: 3, col: 3))
print(canvas)

canvas = paintFill(canvas: canvas, withColor: 1, fromPoint: (row: 3, col: 3))
print(canvas)