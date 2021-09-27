//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Virtual Machine on 27/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var labelResultadoCalculado: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    var resultadoCalculado: Float?
    var numberOfPeople: Int?
    var numberOfTip: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let numberOfPeople = numberOfPeople else {
            return
        }
        
        guard let numberOfTip = numberOfTip else {
            return
        }
        
        if let resultadoPorPessoa = resultadoCalculado{
            self.labelResultadoCalculado.text = "\(String(describing: resultadoPorPessoa))"

        }
        
        self.labelDescricao.text = "Split between \(String(describing: numberOfPeople)) people, with \(String(describing: numberOfTip))% tip."
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnToRecalculate(_ sender: UIButton) {
        
        dismiss(animated: true)
        
    }
    

}
