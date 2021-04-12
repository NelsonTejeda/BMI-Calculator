//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by nelson tejeda on 6/9/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    mutating func calculateBMI(height: Float, weight: Float ){
        let bmiValue =  weight / powf(height, 2)
        var adviceMessage: String
        var bgColor: UIColor
        if(bmiValue >= 18.5 && bmiValue <= 24.9){
            adviceMessage = "Good"
            bgColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            
        }
        else if(bmiValue < 18.5){
            adviceMessage = "under"
            bgColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        else{
            adviceMessage = "Over"
            bgColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        bmi = BMI(value: bmiValue, advice: adviceMessage, color: bgColor)
    }
    func getBMIValue() -> String {
        return String(format: "%.2f", bmi?.value ?? "0.0")
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice needed"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
