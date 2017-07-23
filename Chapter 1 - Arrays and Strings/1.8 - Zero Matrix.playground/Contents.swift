// Write an algorithm such that if an element in an MxN matrix is 0, 
// its entire row and column are set to 0.

func zeroMatrix(matrix: [[Int]]) -> [[Int]] {
    var outputMatrix = matrix
    for row in matrix.enumerated() {
        for point in row.element.enumerated() {
            if point.element == 0 {
                for outputRow in outputMatrix.enumerated() {
                    if outputRow.offset == row.offset {
                        for outputElement in outputRow.element.enumerated() {
                            outputMatrix[outputRow.offset][outputElement.offset] = 0
                        }
                    } else {
                        outputMatrix[outputRow.offset][point.offset] = 0
                    }
                }
            }
        }
    }
    return outputMatrix
}

// 1,0,1
// 0,0,0
// 1,0,1
var matrix = [
    [1,1,1],
    [1,0,1],
    [1,1,1]
]
zeroMatrix(matrix: matrix)

// 0,0,0
// 0,1,0
// 0,0,0
matrix = [
    [0,1,1],
    [1,1,1],
    [1,1,0]
]
zeroMatrix(matrix: matrix)