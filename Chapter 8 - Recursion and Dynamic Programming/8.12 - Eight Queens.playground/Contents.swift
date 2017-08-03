/*
    Write an algorithm to print all ways of arranging eight queens on an 8x8 chess board so that none of them share the same row, column, or diagonal. In this case, "diagonal" means all diagonals, not just the two that bisect the board.
*/

import Foundation

typealias Board = [[Int]]
let queen = 1
let empty = 0

func placeQueens(onBoard board: Board,
                 placedRows: Board = [[Int]](),
                 invalidColumns: [Int] = [Int](),
                 invalidColumnsDecreasing: [Int] = [Int](),
                 invalidColumnsIncreasing: [Int] = [Int]()) -> [Board] {
    typealias Point = (row: Int, col: Int)
    
    guard board.count > 0 else { return [placedRows] }
    
    var invalidColumnsDecreasing = invalidColumnsDecreasing
    var invalidColumnsIncreasing = invalidColumnsIncreasing
    var invalidColumns = invalidColumns
    
    for i in 0..<invalidColumnsDecreasing.count {
        invalidColumnsDecreasing[i] -= 1
        invalidColumnsIncreasing[i] += 1
    }
    
    var boards = [Board]()
    
    for col in board.first!.enumerated() {
        if !invalidColumnsDecreasing.contains(col.offset) &&
            !invalidColumnsIncreasing.contains(col.offset) &&
            !invalidColumns.contains(col.offset) {
            var board = board
            board[0][col.offset] = queen
            for board in placeQueens(onBoard: Array(board[1..<board.count]),
                                     placedRows: placedRows + [board[0]],
                                     invalidColumns: invalidColumns + [col.offset],
                                     invalidColumnsDecreasing: invalidColumnsDecreasing + [col.offset],
                                     invalidColumnsIncreasing: invalidColumnsIncreasing + [col.offset]) {
                                        boards.append(board)
            }
        }
    }
    
    return boards
}

var board = [
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0]
]
placeQueens(onBoard: board)

