//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by osmanyesil on 12/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var isJames = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //Tıklanabilir hale getirdik
        imageView.isUserInteractionEnabled = true
        
        // UITapGestureRecognizer ; Bir veya birden fazla tıklamayı algılamak için kullanılıyor.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }


    
    @objc func changePic(){
        
        if isJames != true {
            
            //Resmi ve label ımızı değiştirdik
            imageView.image = UIImage(named: "james")
            myLabel.text = "James Hotfield"
            isJames = true
        } else {
            //Resmi ve label ımızı değiştirdik
            imageView.image = UIImage(named: "larse")
            myLabel.text = "Lars Ulrich"
            isJames = false
        }
        
    }
}

