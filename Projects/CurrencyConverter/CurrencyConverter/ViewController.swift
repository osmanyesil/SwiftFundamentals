//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by osmanyesil on 1/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!    
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var getRatesClicked: UIButton!
    @IBOutlet weak var btnGetRates: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        
        /*
            1) Request & Session = Api istek atmak
            2) Response & Data =   Datayı almak
            3) Parsing & Json Serialization = Veriyi işlemek
         */
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=0c7b351dac577aa63eef53842ca02498&format=1")
        let session = URLSession.shared
        
        //Input veriyoruz ve bize çıktı oluşturucak. completionHandler bir closure 'dır.
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil { // Hata var ise
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                if data != nil {
                    do {
                        //jsonResponse u  " as! Dictionary<String, Any> " ile dönüştürmemiz gerkeiyor ki datayı pars edebilelim
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //Http isteğimiz haricinde yapılacka işlemleri ana threadde yapmamız gerekiyor. ASYNC burası
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                print(rates)
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD : \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF : \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP : \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY : \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD : \(usd)"
                                }
                                if let turkish = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY : \(turkish)"
                                }
                            }
                        }
                        
                        
                    } catch{
                        print("Error")
                    }
                }
                
            }
        }
        task.resume() //İşlemi başlatma
        
    }
    
}

