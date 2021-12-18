//
//  ViewController.swift
//  ObjectWithCode
//
//  Created by osmanyesil on 12/18/21.
//

import UIKit

class ViewController: UIViewController {

    let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Label defined
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        //myLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        myLabel.frame = CGRect(x: width * 0.5 - width * 0.8 / 2 , y: height * 0.5 - 50/2, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        
        let myButton = UIButton() //Buton tanımlama
        myButton.setTitle("myButton" , for: UIControl.State.normal)  //Buton text
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)  //Buton rengi
        myButton.frame = CGRect(x: width * 0.5 - 100, y: height * 0.6, width: 200, height: 100) //Buton konumu
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myAction), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func myAction(){
        print("tapped")
        myLabel.text = "Tıklandı!!!...."
    }


}

