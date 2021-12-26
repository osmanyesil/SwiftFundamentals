//
//  SecondViewController.swift
//  SegueApp
//
//  Created by osmanyesil on 12/21/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = myName
        
        // Do any additional setup after loading the view.
    }
    



}
