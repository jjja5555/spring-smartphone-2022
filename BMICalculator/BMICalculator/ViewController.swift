//
//  ViewController.swift
//  BMICalculator
//
//  Created by Xiao Huang on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtWeight: UITextField!
    @IBOutlet var txtFeet: UITextField!
    @IBOutlet var txtInches: UITextField!
    @IBOutlet var txtResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: Any) {
        let weightInKg = Double(txtWeight.text!)! * 0.453592
        let heightInCm = Double(txtFeet.text!)! * 30.48 + Double(txtInches.text!)! * 2.54
        let heightInM = heightInCm/100
        var bmi = weightInKg / (heightInM * heightInM)
        bmi = round(bmi * 100) / 100.0
        var msg = ""
        if(bmi < 18.5){
            msg = "UnderWeight"
        }else if(bmi < 25){
            msg = "Healthy weight"
        }else if(bmi < 30){
            msg = "Overweight"
        }else{
            msg = "Obese"
        }
            
        txtResult.text = "BMI:\(bmi)\n\(msg)"
        
    }
    
}

