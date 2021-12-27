//
//  ViewController.swift
//  AlertProject
//
//  Created by osmanyesil on 12/27/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signupClicked(_ sender: Any) {
        /*
        //Uyarı mesajının tanımlanması
        let alert = UIAlertController(title: "Error!", message: "Username not found!", preferredStyle: UIAlertController.Style.alert)
        //Mesajbox içine buton eklenmesi işlemi
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("Button Clicked")
        }
        //Oluşturulduğumuz AlertAction'ın alert'imize eklenmesi
        alert.addAction(okButton)
        // Mesaj'ın gösterilmesi present aksiyonu ile
        self.present(alert, animated: true, completion: nil)
         */
        
        if  usernameText.text == ""{
            messageShow(paramTitle: "Error", paramMessage: "Username not found")
        } else if passwordText.text == "" {
            messageShow(paramTitle: "Error", paramMessage: "Password not found")
        }
        else if passwordText.text != password2Text.text {
            messageShow(paramTitle: "Error", paramMessage: "Passwords do not match")
        }
        else {
            messageShow(paramTitle: "Success", paramMessage: "Login Success")
        }
                                     
    }
    
    func messageShow(paramTitle : String , paramMessage : String ) {
        let alert = UIAlertController(title: paramTitle, message: paramMessage, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

