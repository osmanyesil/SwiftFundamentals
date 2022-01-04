//
//  ViewController.swift
//  SimpsonBook
//
//  Created by osmanyesil on 1/4/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Characters]()
    var chosenSimpson : Characters?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let homer = Characters(nameInit: "Homer", jobInit: "Nuclear Safety", imageInit: UIImage(named: "homer")!)
        let bart = Characters(nameInit: "Bart", jobInit: "Student", imageInit: UIImage(named: "bart")!)
        let maggie = Characters(nameInit: "Maggie", jobInit: "Baby", imageInit: UIImage(named: "maggie")!)
        let marge = Characters(nameInit: "Marge", jobInit: "HouseWife", imageInit: UIImage(named: "marge")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(bart)
        mySimpsons.append(maggie)
        mySimpsons.append(marge)
    }
    
    //Satırlar ne olacağı
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    //TableView seçilinde detay sayfasına yönlendirme
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }
  
    //Detay sayfamıza seçilen cell bilgilerini gönderiyoruz.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVc"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

