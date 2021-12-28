//
//  ViewController.swift
//  KennyCatchMe
//
//  Created by osmanyesil on 12/28/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblHighScore: UILabel!
    
    var score = 0
    var highScoure = 0
    var timer = Timer()
    var counter = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewClicked()
        highScoreUsers()

    }

    override func viewDidAppear(_ animated: Bool) {
        alertView(title: "Let's Started", message: "Start Game" , btnText: "Start")
    }
    
    func alertView(title : String , message : String, btnText : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let btnStart = UIAlertAction(title: btnText, style: UIAlertAction.Style.default){
            (UIAlertAction) in
            self.startGame()
            if btnText != "Start"{
                self.imgView.isUserInteractionEnabled = true
                self.score = 0
            }
        }
        let btnCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(btnStart)
        alert.addAction(btnCancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @objc func startGame(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction (){
        lblTimer.text = "Timer : \(counter)"
        counter += 1
        updatePosition()
        
        if counter == 10 {
            userDefault()  //Score kaydet
            timer.invalidate() //Timer Durdur
            counter = 0
            lblTimer.text = "Time : "
            lblScore.text = "Score : 0"
            imgView.isUserInteractionEnabled = false  // Imageview tıklanmasını kaldır
            lblTimer.text = "Time's over.."
            alertView(title: "Oyun Bitti!..", message: "Skorunuz \(score)",btnText: "Tekrar Oyna")
        }
    
    }
    
    @objc func updatePosition(){
        let maxX = view.frame.maxX - 350
        let maxY = view.frame.maxY - 300
        let xCoord = CGFloat.random(in: 0...maxX)
        let yCoord = CGFloat.random(in: 0...maxY)
        UIView.animate(withDuration: 0.3){
            self.imgView.transform = CGAffineTransform(translationX: xCoord, y: yCoord)
        }
    }
    
    func imageViewClicked(){
        imgView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scoreCount))
        imgView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func scoreCount(){
        score += 1
        lblScore.text = "Score : \(score)"
        print("İmage clicked")
    }
    
    func userDefault(){
        if let highScoure = UserDefaults.standard.object(forKey: "highScore"){
            if score > highScoure as! Int  { // Neden hata verdi > if  highScoure as! Int < score
                UserDefaults.standard.set(score, forKey: "highScore")
                lblHighScore.text = "HighScore : \(score)"
            }
        }
    }
    
    func highScoreUsers(){ //HighScoreRead
        if let highScoure = UserDefaults.standard.object(forKey: "highScore"){
            lblHighScore.text = "HighScore : \(highScoure)"
        }
        
      
    }

}

