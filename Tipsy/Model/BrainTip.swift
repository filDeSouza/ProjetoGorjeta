//
//  BrainTip.swift
//  Tipsy
//
//  Created by Virtual Machine on 27/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct BrainTip{
    
    var bill: Bill?
    
    func calculateTipp(bill: Float, tipPercentual: Float) -> String{
        
        let calculo = bill + (bill * (tipPercentual / 100))
        print(calculo)
        return "\(calculo)"
    }
    
    func calculateBill(bill: Float, splitt: Float) -> Float{
        
        return bill / splitt
        
    }
    
}
