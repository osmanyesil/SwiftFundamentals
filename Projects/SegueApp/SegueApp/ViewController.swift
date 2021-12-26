//
//  ViewController.swift
//  SegueApp
//
//  Created by osmanyesil on 12/21/21.
//

import UIKit

class ViewController: UIViewController {

    
    var userName : String = ""
    var password : String = ""
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var btnNextButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad function called")
      }
    
    //ViewController kapandığında
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
    
    func login (username : String , password : String){
        print("Login success \(username) + Password : \(password)" )
    }

    //ViewController kapanacak
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear function called")
    }
    
    //ViewController gözükecek
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function called")
    }
    
    //ViewController gözüktü
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function called")
    }
    
    
    
    @IBAction func nextClicked(_ sender: Any) {
        userName = nameTextFiled.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName
        }
    }
}

