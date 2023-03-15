//
//  ViewController.swift
//  FIrstCalculator
//
//  Created by Bekzhan on 30.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model(firstNumber: 0, secondNumber: 0, sign: "")
    
    var userInTheMiddleOfTyping = false
    
    @IBOutlet weak var label: UILabel!

    @IBAction func digitPressed(_ sender: UIButton) {
        label.numberOfLines = 1
        let digit = (sender.titleLabel?.text)!
        
        if label.text?.count == 10 && userInTheMiddleOfTyping == true {
            return
        }
    
        if userInTheMiddleOfTyping {
            label.text = label.text! + digit
            
        } else {
            label.text = digit
            userInTheMiddleOfTyping = true
        }
    }
    
    
    @IBAction func operationPressed(_ sender: UIButton) {
        if let text = label.text {
            model.firstNumber = Double(text)!
            model.sign = (sender.titleLabel?.text)!
            userInTheMiddleOfTyping = false
        }
        
        print("\(model.sign)")
    }
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
        label.text = "0"
        model.clear()
        userInTheMiddleOfTyping = false
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
        if model.secondNumber == 0 && model.sign == "" {
            return
        }
        
        let result = model.getResult(text: label.text)
        userInTheMiddleOfTyping = false
    
        label.text = result
    }
    
    
    @IBAction func negativePressed(_ sender: UIButton) {
        let number = model.toNegative(text: label.text)
        let result = model.checkDouble(result: number)
        label.text = "\(result)"
    }
    
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if model.checkingDot(text: label.text) {
            label.text! += "."
        }
        userInTheMiddleOfTyping = true
    }
    
    
    @IBAction func percentPressed(_ sender: UIButton) {
        let percent = model.getPercent(text: label.text)
        let result = model.checkDouble(result: percent)
        label.text = "\(result)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

