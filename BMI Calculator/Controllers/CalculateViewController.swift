//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func heightChange(_ sender: UISlider) {
        print(String(format: "%.2f", sender.value))
        
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    

    @IBAction func weightChange(_ sender: UISlider) {
        print(String(format: "%.0f", sender.value))
        weightLabel.text = String(format: "%.0fKg", sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let heightValue = heightSlider.value
        let weightValue = weightSlider.value
        calculatorBrain.calculateBMI(height: heightValue, weight: weightValue)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResults"){
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    
}

