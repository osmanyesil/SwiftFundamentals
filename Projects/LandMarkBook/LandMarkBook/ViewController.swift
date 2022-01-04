//
//  ViewController.swift
//  LandMarkBook
//
//  Created by osmanyesil on 12/29/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandMarkNames = ""
    var chosenLandMarkImages = UIImage()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append( "Roma - Collesseum")
        landmarkNames.append( "Çin - Çin Seddi")
        landmarkNames.append( "Muğla - Ölüdeniz")
        landmarkNames.append( "Trabzon - Uzun Göl")
        
        
        landmarkImages.append(UIImage(named: "collosseum")!)
        landmarkImages.append(UIImage(named: "greatewall")!)
        landmarkImages.append(UIImage(named: "mugla")!)
        landmarkImages.append(UIImage(named: "trabzon.jpeg")!)
        
        
        navigationItem.title = "Landmark Book"
    }
    
    //Satırlarımızın içerisinde ne olacak. Cell oluşturma
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    
    //Tableview kaç adet satır olacak
    func tableView(_ tableView:UITableView , numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    // EditinStyle = (delete,insert,none kontrol)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade) //İlgili satırı sildik
        }
    }
    
    //Satır seçildiğinde ne yapılacak.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         chosenLandMarkNames = landmarkNames[indexPath.row] // Seçilen row
         chosenLandMarkImages = landmarkImages[indexPath.row] // Seçilen resim
        
        
        //Diğer sayfaya yönlendirme
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    //Segue(Yönlendirme) olmadan önce yapılacak işlem
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController // Gidilecek olan View Controller
            destinationVC.selectedLandMarkName = chosenLandMarkNames
            destinationVC.selectedLandMarkImage = chosenLandMarkImages
        }
    }
}

