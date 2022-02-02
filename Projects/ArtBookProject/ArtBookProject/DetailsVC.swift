//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by osmanyesil on 1/6/22.
//

import UIKit
import CoreData

class DetailsVC: UIViewController,UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var chosenPainting = ""
    var chosenPaintingId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.isEnabled = false
        if chosenPainting != ""{
            
            //Core Data : Herhangi bir resim seçildi ise
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "Paintings")
            
            //Core Data Filtreleme işlemi
            let idString = chosenPaintingId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)  //ID ile arama
            
            do{
               let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        if let name = result.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        if let artist = result.value(forKey: "artist") as? String {
                            artistText.text = artist
                        }
                        
                        if let year = result.value(forKey: "year") as? Int {
                            yearText.text = String(year)
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                        
                        
                    }
                }
            }catch{
                print("error")
            }
        }else {
            saveButton.isEnabled = false
            nameText.text = ""
            artistText.text = ""
            yearText.text = ""
        }
        
        
        
        
        //GestureRecognizer kullanıcının yaptığı hareketleri algılamamızı yarar. Üstüne basma, Uzun basma vs.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        //İmageView tıklandığında
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
    }
    
    @objc func selectImage(){
        //Galeriyi aç
        
        let picker = UIImagePickerController() // Kullanıcı medya kütüphanesine erişmek için kullanılır
        picker.delegate = self
        picker.sourceType = .photoLibrary  // Kameradanmı galeriden mi ? açılacak
        picker.allowsEditing = true //Kullanıcı fotoğraf seçtikten sonra editleyebilir
        present(picker, animated: true, completion: nil) //picker göster
    }
    
    //Kullanıcı galeriden fotoğraf seçtikten sonra ne olacak
    //Bu metod bize seçilen fotoğrafın Info adında dictionary döner (editlenmiş foto, original foto vb )
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        
        //CoreData context ulaşmak için standart block
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        //Attributes
        newPainting.setValue(nameText.text!, forKey: "name")
        newPainting.setValue(artistText.text!, forKey: "artist")
        
        if let year = Int(yearText.text!){ //verilen değeri integer dönüştürme
            newPainting.setValue(year, forKey: "year")
        }
        
        newPainting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newPainting.setValue(data, forKey: "image")
        
        //Attributes kaydetme
        do{
            try context.save()
            print("success")
        }catch{
            print("error")
        }
        
        
        //Diğer view controller'a mesaj yollamamıza olanak sağlar. Kayıt oluşturulduktan sonra tüm wc'a notification gönderir
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        
        self.navigationController?.popViewController(animated: true)// Bir önceki viewcontroller a dön
        
        
    }
    

}
