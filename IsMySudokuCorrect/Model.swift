//
//  Model.swift
//  IsMySudokuCorrect
//
//  Created by Asil Erguner on 2018-01-14.
//  Copyright © 2018 Asil Erguner. All rights reserved.
//

import Foundation

class Sudoku {
    class func isTrueForEach (board: [[Character]], x1: Int, y1: Int, x2: Int, y2: Int) -> Bool {
        var singleSet: Set<Character> = Set()
        for i in x1...x2 {
            for j in y1...y2 {
                if board[i][j] != "." {
                    if singleSet.contains(board[i][j]) == true {
                        return false
                    } else {
                        singleSet.insert(board[i][j])
                    }
                }
            }
        }
        return true
    }
    
    class func isTrueForAll (_ board: [[Character]], mySudokuSize: Int) -> Bool {
        let isMySudokuSizeEven : Bool = mySudokuSize % 2 == 0
        for i in 0..<mySudokuSize {
            if isTrueForEach(board: board, x1: i, y1: 0, x2: i, y2: mySudokuSize-1) == false {
                return false
            }
            if isTrueForEach(board: board, x1: 0, y1: i, x2: mySudokuSize-1, y2: i) == false {
                return false
            }
        }
        if isMySudokuSizeEven {
            for i in 0..<(mySudokuSize/3) {
                for j in 0..<(mySudokuSize/3) {
                    if isTrueForEach(board: board, x1: i*2, y1: j*3, x2: i*2+1, y2: j*3+2) == false {
                        return false
                    }
                }
            }
        } else {
            for i in 0..<(mySudokuSize/3) {
                for j in 0..<(mySudokuSize/3) {
                    if isTrueForEach(board: board, x1: i*3, y1: j*3, x2: i*3+2, y2: j*3+2) == false {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}
