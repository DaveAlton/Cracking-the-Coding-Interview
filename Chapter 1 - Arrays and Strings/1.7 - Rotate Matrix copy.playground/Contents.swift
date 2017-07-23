// Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes,
// write a method to rotate the image by 90 degrees. Can you do this in place?

func rotateMatrix(matrix: inout [[Int]]) -> [[Int]] {
    let max = matrix.count - 1
    for col in 0..<Int(matrix.first!.count/2) {
        for row in 0..<Int((Double(matrix.count)/2.0).rounded()) {
            let topRightCoord    = (row: col,     col: max-row)
            let bottomRightCoord = (row: max-row, col: max-col)
            let bottomLeftCoord  = (row: max-col, col: row)
            let topLeftCoord     = (row: row,     col: col)
            
            let topRight = matrix[topRightCoord.row][topRightCoord.col]
            let bottomRight = matrix[bottomRightCoord.row][bottomRightCoord.col]
            let bottomLeft = matrix[bottomLeftCoord.row][bottomLeftCoord.col]
            let topLeft = matrix[topLeftCoord.row][topLeftCoord.col]
            
            matrix[bottomLeftCoord.row].remove(at: bottomLeftCoord.col)
            matrix[bottomLeftCoord.row].insert(bottomRight, at: bottomLeftCoord.col)
            
            matrix[topLeftCoord.row].remove(at: topLeftCoord.col)
            matrix[topLeftCoord.row].insert(bottomLeft, at: topLeftCoord.col)
            
            matrix[topRightCoord.row].remove(at: topRightCoord.col)
            matrix[topRightCoord.row].insert(topLeft, at: topRightCoord.col)
            
            matrix[bottomRightCoord.row].remove(at: bottomRightCoord.col)
            matrix[bottomRightCoord.row].insert(topRight, at: bottomRightCoord.col)
        }
    }
    return matrix
}

// 3,1
// 4,2
var matrix = [
    [1,2],
    [3,4]
]
rotateMatrix(matrix: &matrix)

// 7,4,1
// 8,5,2
// 9,6,3
matrix = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]
rotateMatrix(matrix: &matrix)

// 12,08,04,00
// 13,09,05,01
// 14,10,06,02
// 15,11,07,03
matrix = [
    [00,01,02,03],
    [04,05,06,07],
    [08,09,10,11],
    [12,13,14,15]
]
rotateMatrix(matrix: &matrix)