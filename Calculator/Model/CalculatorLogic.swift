//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Andrae Henry on 5/13/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    private var intermediateCalculation : (n1: Double, opMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double?{
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            }
                
            else if symbol == "AC"{
                return  0
            }
                
            else if symbol == "%" {
                return n * 0.01
            }
            else if symbol == "=" {
                return performTwoNumCalculation(n2: n)
            }
            else {
                intermediateCalculation = (n1: n, opMethod: symbol)
            }
        }
        return nil
               
    }
    func performTwoNumCalculation(n2: Double)->Double?{
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.opMethod{
           
            switch operation {
            case "+":
                return n1 + n2
                
            case "-":
                return n1 - n2
                
            case "%":
                return n1 / n2
                
            case "×":
                return n1 * n2
                
            default:
                fatalError("I don't even know how you managed to trigger this default case. Operation does not match options.")
            }
        }
        return nil
    }
}
