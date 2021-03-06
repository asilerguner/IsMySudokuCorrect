//
//  IsMySudokuCorrectUITests.swift
//  IsMySudokuCorrectUITests
//
//  Created by Asil Erguner on 2018-01-13.
//  Copyright © 2018 Asil Erguner. All rights reserved.
//

import XCTest

class IsMySudokuCorrectUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        
        let app = XCUIApplication()
        app.otherElements.containing(.staticText, identifier:"Is My Sudoku Correct?").element.tap()
        
        let textView = app.otherElements.containing(.staticText, identifier:"Is My Sudoku Correct?").children(matching: .textView).element
        textView.tap()
        app.buttons["9 x 9"].tap()
        textView.tap()
        textView.typeText("435269781682571493197834562826195347374682915951743628519326874248957136763418259")
        
        let checkButton = app.buttons["Check"]
        checkButton.tap()
        app.buttons["6 x 6"].tap()
        textView.tap()
        textView.typeText("235614146523612435354261523146461352")
        checkButton.tap()
        textView.typeText("2365")
        checkButton.tap()
        app.alerts["Error"].buttons["OK"].tap()



        

    }
    
}
