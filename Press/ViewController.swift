//
//  ViewController.swift
//  Press
//
//  Created by Miguel Valdez on 3/19/16.
//  Copyright © 2016 Miguel Valdez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var scoreLabelTitle: UILabel!
    @IBOutlet weak var timeLabelTitle: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var play_b: UIButton!
    @IBOutlet weak var BadButton: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!

    var firstButtonPressed = false
    private var score = scoreTaker()
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    let gameTime:Double = 30
    var currentTile = 0
    var loopBreaker = 0
    
    func startGame() {
        
        let aSelector : Selector = #selector(ViewController.updateTime)
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        
    }
    
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        var elapsedTime = currentTime - startTime
        let seconds = gameTime-elapsedTime
        if seconds > 0 {
            elapsedTime -= NSTimeInterval(seconds)
            print("\(Int(seconds))")
            timeLabel.text = ("\(Int(ceil(seconds)))")
        } else {
            if (loopBreaker < 1) {
            timeLabel.text = ("\(Int(ceil(seconds)))")
            timer.invalidate()
            gameOver()
            loopBreaker += 1
            }
        }
    }
    
    
    @IBAction func PressButton(sender: UIButton) {
        if (firstButtonPressed == false) {
            startGame()
            createB()
            score.addPoint()
            firstButtonPressed = true
            scoreLabel.text = ("\(score.score)")
        } else {
            createB()
            score.addPoint()
            scoreLabel.text = ("\(score.score)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func badButtonPressed(sender: UIButton) {
        gameOver()
    }
    
    
    @IBAction func play_pressed(sender: AnyObject) {
        play_b.hidden = true
        BadButton.hidden = false
        scoreLabel.hidden = false
        scoreLabelTitle.hidden = false
        timeLabel.hidden = false
        timeLabelTitle.hidden = false
        restartButton.hidden = false
        createB()
        
        }
    

    func createB() {
     
        var rand = Int(arc4random_uniform(8)+1) // Random number from 1 to 9?
        
        if (currentTile > 0 ) {
            while (currentTile == rand){
                rand = Int(arc4random_uniform(8)+1) // Random number from 1 to 9?
            }
        }
        
        switch rand {
        case 1:
            turnBoff()
            b1.hidden = false
        case 2:
            turnBoff()
            b2.hidden = false
        case 3:
            turnBoff()
            b3.hidden = false
        case 4:
            turnBoff()
            b4.hidden = false
        case 5:
            turnBoff()
            b5.hidden = false
        case 6:
            turnBoff()
            b6.hidden = false
        case 7:
            turnBoff()
            b7.hidden = false
        case 8:
            turnBoff()
            b8.hidden = false
        case 9:
            turnBoff()
            b9.hidden = false
        default:
            turnBoff()
            b9.hidden = false
        }
        currentTile = rand
    }
    
    @IBAction func RestartButtonPressed(sender: UIButton) {
        firstButtonPressed = false
        score.score = 0
        scoreLabel.text = ("\(score.score)")
        gameOver()
        startGame()
    }
    
    func turnBoff() {
        b1.hidden = true
        b2.hidden = true
        b3.hidden = true
        b4.hidden = true
        b5.hidden = true
        b6.hidden = true
        b7.hidden = true
        b8.hidden = true
        b9.hidden = true
    }

    func gameOver() {
        turnBoff()
        BadButton.hidden = true
        
    }
    
}

