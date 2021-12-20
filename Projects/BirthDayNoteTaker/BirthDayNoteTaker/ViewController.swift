//
//  ViewController.swift
//  BirthDayNoteTaker
//
//  Created by osmanyesil on 12/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtBirthday: UITextField!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var lblBirthDay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting işlemi - as? vs as!
        //as? = Eğer cast edebilirsen dönüştür
        //as! = Kesinlikle dönüştürebilirsin
        
        if let myName = storedName as? String {
            lblText.text = myName
        }
        
        if let myBirthday = storedBirthday as? String {
            lblBirthDay.text = myBirthday
        }
    }

    @IBAction func btnSaveClicked(_ sender: Any) {
 
        //UserDefault Yazma İşlemi
        //UserDefault sınıfı ; Key-value tutabiliriz.
        //UserDeafult.standart.synchronize()  ; Debrecated olmuş metod yazılmasına artık gerek yok
        UserDefaults.standard.set(txtName.text, forKey: "name")
        UserDefaults.standard.set(txtBirthday.text, forKey: "birthday")
        
        
        if let name = txtName.text {
            lblText.text = "Name : \(name)" // String ifade içinde değişken kullanımı /(değişken)
            if let birthday = txtBirthday.text {
                lblBirthDay.text = "Birthday : \(birthday)"
            }
        }
    }
    
    
    @IBAction func btnDelete(_ sender: Any) {
        
        //UserDefault silme işlemi
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")

        
        //"" vs nil = tanımlanmış ama değeri olmayan nil
        
        if (storedName as? String) != nil { // storedName'in string e cast edilmiş hali nil değilse
            UserDefaults.standard.removeObject(forKey: "name")
            lblText.text = "Name : "
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            lblBirthDay.text = "BirthDay :: "
        }
    }
    
    
}

