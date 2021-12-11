//
//  ViewController.swift
//  Calculator
//
//  Created by osmanyesil on 11/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    
    @IBOutlet weak var lblSonucLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSumAction(_ sender: Any) {
      
        self.lblSonucLabel.text = "Sonuç Label => " + String(Int(txtField1.text!)! + Int(txtField2.text!)!)
        
    }
    
    @IBAction func btnCikarAction(_ sender: Any) {
        
        self.lblSonucLabel.text = "Sonuç Label => " + String(Int(txtField1.text!)! - Int(txtField2.text!)!)
        
        
    }
    @IBAction func btnCarpAction(_ sender: Any) {
        
        self.lblSonucLabel.text = "Sonuç Label => " + String(Int(txtField1.text!)! * Int(txtField2.text!)!)
    }
    
    @IBAction func btnBolAction(_ sender: Any) {
        
        self.lblSonucLabel.text = "Sonuç Label => " + String(Int(txtField1.text!)! / Int(txtField2.text!)!)
        
    }
    
    
}

