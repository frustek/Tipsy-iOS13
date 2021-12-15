//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {


    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople : Int = 2
    var billTotal = 0.0
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPercentTip.isSelected = false
        tenPercentTip.isSelected = false
        twentyPercentTip.isSelected = false
        sender.isSelected = true

        let buttonTitle = sender.currentTitle
        let buttonTitleMinusPercentSign = buttonTitle?.dropLast()
        let buttonTitleValue = Double(buttonTitleMinusPercentSign!)
        tip = buttonTitleValue!/100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billValue = billTextField.text!
        
        if billValue != "" {
            
            billTotal = Double(billValue)!
            billTotal = billTotal * ( 1 + tip)
            billTotal = billTotal / Double(numberOfPeople)
            
//            print(billTotal)
//
//            let resultTo2DecimalPlaces = String(format: "%.2f", billTotal)
//            print(resultTo2DecimalPlaces)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
            
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.result = billTotal
            resultsViewController.tip = Int(tip * 10)
            resultsViewController.split = numberOfPeople
            
        }
    }
    
    
}

