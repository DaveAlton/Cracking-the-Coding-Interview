// Imagine a robot sitting on the upper left corner of grid with r rows and c columns. 
// The robot can only move in two directions, right and down, but certain cells are 
// "off limits" such that the robot cannot step on them. Design an algorithm to find 
// a path for the robot from the top left to the bottom right.

func pathCountThroughGrid(grid: [[Int]], from point: (row: Int, col: Int) = (row: 0, col: 0)) -> Int {
    var memo = [String: Int]()
    func pointDescription(_ point: (row: Int, col: Int)) -> String {
        return "\(point.row)|\(point.col)"
    }
    func pathsUsingMemo(grid: [[Int]], from point: (row: Int, col: Int)) -> Int {
        guard memo[pointDescription(point)] == nil else { return memo[pointDescription(point)]! }
        
        if point.row == grid.count - 1 {
            return grid[point.row][point.col..<grid[point.row].count].contains(0) ? 0 : 1
        }
        if point.col == grid[point.row].count - 1 {
            for row in grid.enumerated() {
                if row.offset > point.row, let last = row.element.last, last == 0 {
                    return 0
                }
            }
            return 1
        }
        
        var count = 0
        if grid[point.row][point.col + 1] == 1 {
            count += pathCountThroughGrid(grid: grid, from: (row: point.row, col: point.col + 1))
        }
        if grid[point.row + 1][point.col] == 1 {
            count += pathCountThroughGrid(grid: grid, from: (row: point.row + 1, col: point.col))
        }
        memo[pointDescription(point)] = count
        return count
    }
    return pathsUsingMemo(grid: grid, from: point)
}





var grid = [
    [1,1],
    [1,1]
]
pathCountThroughGrid(grid: grid)

grid = [
    [1,1,1,1,1],
    [1,1,1,1,1],
    [1,1,0,1,1],
    [1,1,1,1,1]
]
pathCountThroughGrid(grid: grid)

grid = [
    [1,1,1,1],
    [1,1,1,1],
    [1,1,1,1],
    [1,1,1,1]
]
pathCountThroughGrid(grid: grid)

grid = [
    [1,1,1,1,1],
    [1,1,1,1,1],
    [1,1,1,1,0],
    [1,1,1,1,1]
]
pathCountThroughGrid(grid: grid)

grid = [
    [1,1,1,1,1],
    [1,1,1,1,1],
    [1,1,1,1,1],
    [1,1,1,1,0]
]
pathCountThroughGrid(grid: grid)
