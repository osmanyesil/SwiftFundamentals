//
//  imageViewController.swift
//  LandMarkBook
//
//  Created by osmanyesil on 1/2/22.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landMarkNames: UILabel!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landMarkNames.text = selectedLandMarkName
        imageView.image = selectedLandMarkImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
