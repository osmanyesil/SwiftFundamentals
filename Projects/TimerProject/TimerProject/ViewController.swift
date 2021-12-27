//
//  ViewController.swift
//  TimerProject
//
//  Created by osmanyesil on 12/27/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        
        /*Timer interval ; 1 sn de,
                target = Hedef UIViewController
                selector = Event kısmı
                userInfo = Kullanıcıya bilgi dönülecek mi
                repeats = tekrar ediyor mu ?
         */
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    
    }

    
    @objc func timerFunction(){
        timeLabel.text = "Timer : \(counter)"
        counter -= 1  // 1 er 1 er azaltıyoruz counter'ı
        
        
        //Timer sıfır olduğunda durdur. invalidate
        if counter == 0 {
            timer.invalidate()
            timeLabel.text = "Time's Over"
        }
        
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        print("button clicked")
    }
    
}

