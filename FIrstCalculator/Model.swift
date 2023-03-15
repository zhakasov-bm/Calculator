//
//  Model.swift
//  FIrstCalculator
//
//  Created by Bekzhan on 30.09.2022.
//

import Foundation
import UIKit

struct Model {
    var firstNumber: Double
    var secondNumber: Double
    var sign: String
    
    func performOperation() -> Double{
        if sign == "+" {
            return firstNumber + secondNumber
        } else if sign == "-" {
            return firstNumber - secondNumber
        } else if sign == "÷" {
            return firstNumber / secondNumber
        } else if sign == "x" {
            return firstNumber * secondNumber
        } else {
            return 0
        }
    }
    
    mutating func clear() {
        firstNumber = 0
        secondNumber = 0
        sign = ""
    }
    
    mutating func getResult(text: String?) -> String{
        var result = 0.0
        if let text = text {
            secondNumber = Double(text)!
            result = performOperation()
            secondNumber = 0
            sign = ""
        }
        
        return checkDouble(result: result)
    }
    
    func checkDouble(result: Double) -> String{
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return "\(Int(result))"
        } else {
            let roundedV = round(result * 100000) / 100000
            return "\(roundedV)"
        }
    }
    
    func checkingDot(text: String?) -> Bool{
        if let text = text {
            for ch in text {
                if ch == "." { return false }
            }
        }
        return true
    }
    
    func toNegative(text: String?) -> Double{
        let neg = 0.0 - Double(text!)!
        return neg
    }
    
    func getPercent(text: String?) -> Double {
        let percent = Double(text!)! / 100
        return percent
    }
}

