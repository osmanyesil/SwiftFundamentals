//
//  ViewController.swift
//  ArtBookProject
//
//  Created by osmanyesil on 1/4/22.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var nameArray = [String]()
    var idArray = [UUID]()

    @IBOutlet weak var tableView: UITableView!
    
    var selectedPainting = ""
    var selectedPaintingId :UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation bar içine buton ekleme
        navigationController?.navigationBar.topItem?.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        getData()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        //observer  : bu view controller
        //selector : yapılacak işlem
        //name : Notification'a verilen isim
        //YENİ BİR KAYIT OLUŞTUĞUNDA tableView güncelle
        NotificationCenter.default.addObserver(self, selector: #selector (getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
    
    
    @objc func getData(){
        
        //Arraylerimizin içi dolu ise temizliyoruz
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //Fetch işlemi (çekme)
        let fecthRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fecthRequest.returnsObjectsAsFaults = false //Cache'den okuma
        
        do{
            let results = try context.fetch(fecthRequest)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String{
                        self.nameArray.append(name)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID {
                        self.idArray.append(id)
                    }
                    
                    //Tableview refresh işlemi
                    self.tableView.reloadData()
                }
            }
            
        }catch{
            print("error")
        }
        
    }
    
    //Yeni bir kayıt ekle
    @objc func addButtonClicked(){
        selectedPainting = ""  // Herhangi bir görsel seçilmedi bilgisibi toDetailsVC'a gönderiyoruz.
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    //Kaç satır olacağı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    //Satırlarımızın içiğnde ne var
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    //Satır seçildiğinde detailVC ye yönlendirmeden önce yapılacak işlemler
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{ //Seçilen satır bilgisini DetailVC içine gönderme
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.chosenPainting = selectedPainting
            destinationVC.chosenPaintingId = selectedPaintingId
        }
    }
    
    //Satır seçildiğinde detailVC ye yönlendir
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPainting = nameArray[indexPath.row]  //Hangi satır seçildiği bilgisi
        selectedPaintingId = idArray[indexPath.row]  //Hangi Id seçildi bilgisi
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    
    //Satırları silmek
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Core Data silme işlemi
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = idArray[indexPath.row].uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
            let results = try context.fetch(fetchRequest) //Silinmek istenen kayda ulaştık
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let id = result.value(forKey: "id") as? UUID{
                            if id == idArray[indexPath.row]{
                                context.delete(result) // Core data'dan sil
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                tableView.reloadData() //TableView refresh
                                
                                do {
                                    try context.save() // Coredata kaydet 
                                }catch {
                                    print("error")
                                }
                            }
                        }
                            
                    }
                    
                }
                
            } catch {
                
            }
        }
    }
}

