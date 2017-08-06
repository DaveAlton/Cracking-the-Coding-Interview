/*
 Given an M x N matrix in which each row and each column is sorted in ascending order, write a method to find an element.
*/

import Foundation

typealias Point = (row: Int, col: Int)

func findElement(element: Int, inMatrix matrix: [[Int]]) -> Point {
    var row: Int?
    var pivot = matrix.count / 2
    while row == nil {
        if matrix[pivot].first! <= element {
            if pivot == matrix.count - 1 {
                row = pivot
                break
            }
            if matrix[pivot + 1].first! > element {
                row = pivot
                break
            }
            pivot = pivot + Int((Double(pivot) / 2).rounded())
        } else {
            pivot = pivot / 2
        }
    }
    var col: Int?
    let matrixRow = matrix[row!]
    pivot = matrixRow.count / 2
    while col == nil {
        if matrixRow[pivot] == element {
            col = pivot
        } else if matrixRow[pivot] < element {
            pivot = pivot + pivot / 2
        } else {
            pivot = pivot / 2
        }
    }
    return (row: row!, col: col!)
}

var matrix = [
    [0,1,2,3,4,5],
    [6,7,8,9,10],
    [11,12,13,14,15]
]
findElement(element: 15, inMatrix: matrix)

matrix = [
    [0,1,2,3,4,5],
    [6,7,8,9,10],
    [11,12,13,14,15]
]
findElement(element: 0, inMatrix: matrix)