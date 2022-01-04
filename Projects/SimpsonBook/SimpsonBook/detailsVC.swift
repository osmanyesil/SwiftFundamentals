//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by osmanyesil on 1/4/22.
//

import UIKit

class detailsVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    
    var selectedSimpson : Characters?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
        
    }
    



}
