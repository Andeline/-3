//
//  ViewController.swift
//  洗刷刷2
//
//  Created by 蔡佳穎 on 2021/8/17.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var pcImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    
    var playerScore = 0
    var pcScore = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateUI(state: .start)
    }

    @IBAction func oneChosen(_ sender: UIButton) {
        play(userSign: .one)
    }
    
    @IBAction func twoChosen(_ sender: UIButton) {
        play(userSign: .two)
    }
    
    @IBAction func threeChosen(_ sender: UIButton) {
        play(userSign: .three)
    }

    @IBAction func fourChosen(_ sender: UIButton) {
        play(userSign: .four)
    }
    
    @IBAction func fiveChosen(_ sender: UIButton) {
        play(userSign: .five)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        updateUI(state: .start)
    }
    
    func updateUI(state: GameState) {
        statusLabel.text = state.status
        
        oneButton.isEnabled = true
        twoButton.isEnabled = true
        threeButton.isEnabled = true
        fourButton.isEnabled = true
        fiveButton.isEnabled = true
        playAgainButton.isHidden = true
    
        playerScore = 0
        pcScore = 0
        scoreLabel.text = "\(playerScore) : \(pcScore)"
    }
    
    func play(userSign: Sign) {
        //pc亂數出拳
        let opponentSign = randomSign()
        pcImageView.image = UIImage(named: "\(opponentSign.image)")
        pcImageView.transform = CGAffineTransform(scaleX: -1, y: 1)
        
        let talk = AVSpeechUtterance(string: "\(opponentSign)")
                let synthesizer = AVSpeechSynthesizer()
                talk.pitchMultiplier = 1.2
                synthesizer.speak(talk)
        
        //player出拳
        playerImageView.image = UIImage(named: "\(userSign.image)")
        let gameState = userSign.gameState(against: opponentSign)
        statusLabel.text = "\(gameState.status)"
        
        //計算分數
        if gameState == GameState.win {
            playerScore += 1
        } else if gameState == GameState.lose {
            pcScore += 1
        }
        scoreLabel.text = "\(playerScore) : \(pcScore)"
        
        if playerScore == 5 && playerScore > pcScore {
            statusLabel.text = "恭喜大獲全勝"
            oneButton.isEnabled = false
            twoButton.isEnabled = false
            threeButton.isEnabled = false
            fourButton.isEnabled = false
            fiveButton.isEnabled = false
            playAgainButton.isHidden = false
        } else if pcScore == 5 && pcScore > playerScore {
            statusLabel.text = "可以按 Play Again 雪恥"
            oneButton.isEnabled = false
            twoButton.isEnabled = false
            threeButton.isEnabled = false
            fourButton.isEnabled = false
            fiveButton.isEnabled = false
            playAgainButton.isHidden = false
        }
    }
}

