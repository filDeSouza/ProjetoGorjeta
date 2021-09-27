//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var tfBill: UITextField!
    @IBOutlet weak var btZero: UIButton!
    @IBOutlet weak var btTen: UIButton!
    @IBOutlet weak var btTwenty: UIButton!
    @IBOutlet weak var tfSplit: UILabel!
    @IBOutlet weak var stepperSplit: UIStepper!
    var brain = BrainTip()
    var textReturnCalculate: String?
    var billInitial: Float = 0.0
    var valueOfTip: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionTip(_ sender: UIButton) {
        
        if billInitial == 0.0{
            billInitial = (tfBill.text! as NSString).floatValue
        }
                        
        if sender == btTen{
            textReturnCalculate = brain.calculateTipp(bill: billInitial, tipPercentual: 10.0)
            tfBill.text = textReturnCalculate
            valueOfTip = 10
        } else if sender == btTwenty {
            textReturnCalculate = brain.calculateTipp(bill: billInitial, tipPercentual: 20.0)
            tfBill.text = textReturnCalculate
            valueOfTip = 20
        } else if sender == btZero{
            tfBill.text = ("\(billInitial)")
            valueOfTip = 0
        }
        
    }
    
    @IBAction func stepperChange(_ sender: UIStepper) {
        
        tfSplit.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "segueCalculate", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCalculate"{
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultadoCalculado = brain.calculateBill(bill: (self.tfBill.text! as NSString).floatValue, splitt: Float(self.stepperSplit.value))
            destinationVC.numberOfPeople = Int(self.stepperSplit.value)
            destinationVC.numberOfTip = valueOfTip
            print(brain.calculateBill(bill: (self.tfBill.text! as NSString).floatValue, splitt: Float(self.stepperSplit.value)))
            
        }
    }
    
}

