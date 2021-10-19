//
//  ViewController.swift
//  MyFirstApp
//
//  Created by osmanyesil on 10/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeImage(_ sender: Any) {
     
        imageView.image = UIImage.init(named: "metallica2")

}


}
