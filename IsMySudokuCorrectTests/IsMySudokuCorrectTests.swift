//
//  IsMySudokuCorrectTests.swift
//  IsMySudokuCorrectTests
//
//  Created by Asil Erguner on 2018-01-13.
//  Copyright © 2018 Asil Erguner. All rights reserved.
//

import XCTest
@testable import IsMySudokuCorrect

class IsMySudokuCorrectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let mySudokuArray81: String = "435269781682571493197834562826195347374682915951743628519326874248957136763418259"
        let mySudoku81 = Array(mySudokuArray81).chunks(9)
        let result81 = Sudoku.isTrueForAll(mySudoku81, mySudokuSize: 9, isMySudokuSizeEven: false)
        XCTAssertEqual(result81, true)
        
        let mySudokuArray36: String = "235614146523612435354261523146461352"
        let mySudoku36 = Array(mySudokuArray36).chunks(6)
        let result36 = Sudoku.isTrueForAll(mySudoku36, mySudokuSize: 6, isMySudokuSizeEven: true)
        XCTAssertEqual(result36, true)
        
        let mySudokuArray36_2: String = "235614146523612435354261523146461351"
        let mySudoku36_2 = Array(mySudokuArray36_2).chunks(6)
        let result36_2 = Sudoku.isTrueForAll(mySudoku36_2, mySudokuSize: 6, isMySudokuSizeEven: true)
        XCTAssertEqual(result36_2, false)
        
        let mySudokuArrayMissingInfo: String = "???"
        let mySudokuMissingInfo = Array(mySudokuArrayMissingInfo).chunks(6)
        let resultMissingInfo = Sudoku.isTrueForAll(mySudokuMissingInfo, mySudokuSize: 6, isMySudokuSizeEven: true)
        XCTAssertEqual(resultMissingInfo, false)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUIAlertViewShowsAfterIncorrectInput() {
        
    }
}
