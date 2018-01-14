//
//  ViewController.swift
//  IsMySudokuCorrect
//
//  Created by Asil Erguner on 2018-01-13.
//  Copyright © 2018 Asil Erguner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sixSizeButton: UIButton!
    @IBOutlet weak var nineSizeButton: UIButton!
    
    var sudokuSize: String = ""
    
    @IBOutlet weak var sudokuTextView: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    
//    let mySudokuArray: String = "435269781682571493197834562826195347374682915951743628519326874248957136763418259"
//    let mySudokuArray: String = "235614146523612435354261523146461352"
    
    @IBAction func sizeSelectButtonPressed(_ sender: UIButton) {
        switch sender {
        case sixSizeButton:
            sudokuSize = "6"
            sixSizeButton.backgroundColor = #colorLiteral(red: 0, green: 0.4795297384, blue: 0.9950841069, alpha: 1)
            nineSizeButton.backgroundColor = #colorLiteral(red: 0.5670561194, green: 0.08615513891, blue: 0.309137255, alpha: 1)
        case nineSizeButton:
            sudokuSize = "9"
            nineSizeButton.backgroundColor = #colorLiteral(red: 0, green: 0.4795297384, blue: 0.9950841069, alpha: 1)
            sixSizeButton.backgroundColor = #colorLiteral(red: 0.5670561194, green: 0.08615513891, blue: 0.309137255, alpha: 1)

        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultLabel.text = ""
    }
    
    @IBAction func checkButtonPressed(_ sender: Any) {
        
        if sudokuTextView.text != "" && sudokuSize != "" && sudokuTextView.text.isNumeric {
            
            let mySudokuArray: String = sudokuTextView.text
            let mySudokuSize: Int = Int(sudokuSize)!
            let countedSudokuSize: Int = Int(sudokuTextView.text.count)

            if mySudokuSize >= 3 {
                
                if Double(countedSudokuSize) == pow(Double(mySudokuSize), 2){
                    let mySudoku = Array(mySudokuArray).chunks(mySudokuSize)
                    print(mySudoku)
                    
                    if Sudoku.isTrueForAll(mySudoku, mySudokuSize: mySudokuSize) {
                        resultLabel.text = "😃 Correct!"
                    } else {
                        resultLabel.text = "🙁 Not correct"
                    }
                    sudokuTextView.text = ""
                } else {
                    let alert = UIAlertController(title: "Error", message: "Please enter the Sudoku or the size correctly.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Error", message: "Please enter the Sudoku or the size correctly.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Please enter the Sudoku or the size correctly.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        resultLabel.text = ""
        sudokuTextView.text = ""
        sixSizeButton.backgroundColor = #colorLiteral(red: 0.5670561194, green: 0.08615513891, blue: 0.309137255, alpha: 1)
        nineSizeButton.backgroundColor = #colorLiteral(red: 0.5670561194, green: 0.08615513891, blue: 0.309137255, alpha: 1)
        
    }
}

extension Array {
    func chunks(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

extension String {
    var isNumeric : Bool {
        get {
            return Double(self) != nil
        }
    }
}










