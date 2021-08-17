//
//  ViewController.swift
//  洗刷刷2
//
//  Created by 蔡佳穎 on 2021/8/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var pcImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var pcLabel: UILabel!
    
    let playerFingers: [PlayerFinger] = [.one, .two, .three, .four, .five]
    let pcFingers: [PcFinger] = [.one2, .two2, .three2, .four2, .five2]
    var playerScore = 0
    var pcScore = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func play(_ sender: UIButton) {
        //pc隨機出拳
        let pcFinger = pcFingers.randomElement()!.rawValue
        pcImageView.image = UIImage(named: "\(pcFinger)")
        
        //玩家出拳
        var playerFinger = ""
        switch sender {
        case oneButton:
            playerFinger = playerFingers[0].rawValue
            playerImageView.image = UIImage(named: "\(playerFinger)")
        case twoButton:
            playerFinger = playerFingers[1].rawValue
            playerImageView.image = UIImage(named: "\(playerFinger)")
        case threeButton:
            playerFinger = playerFingers[2].rawValue
            playerImageView.image = UIImage(named: "\(playerFinger)")
        case fourButton:
            playerFinger = playerFingers[3].rawValue
            playerImageView.image = UIImage(named: "\(playerFinger)")
        case fiveButton:
            playerFinger = playerFingers[4].rawValue
            playerImageView.image = UIImage(named: "\(playerFinger)")
        default:
            break
        }
        
        //判斷輸贏
        if playerScore <= 5 && pcScore <= 5 {
            if (playerFinger == PlayerFinger.five.rawValue && pcFinger == PcFinger.four2.rawValue) || (playerFinger == PlayerFinger.four.rawValue && pcFinger == PcFinger.three2.rawValue) || (playerFinger == PlayerFinger.three.rawValue && pcFinger == PcFinger.two2.rawValue) || (playerFinger == PlayerFinger.two.rawValue && pcFinger == PcFinger.one2.rawValue) || (playerFinger == PlayerFinger.one.rawValue && pcFinger == PcFinger.five2.rawValue) {
                playerScore += 1
                playerLabel.text = "win"
                pcLabel.text = ""
            } else if (playerFinger == PlayerFinger.five.rawValue && pcFinger == PcFinger.one2.rawValue) || (playerFinger == PlayerFinger.four.rawValue && pcFinger == PcFinger.five2.rawValue) || (playerFinger == PlayerFinger.three.rawValue && pcFinger == PcFinger.four2.rawValue) || (playerFinger == PlayerFinger.two.rawValue && pcFinger == PcFinger.three2.rawValue) || (playerFinger == PlayerFinger.one.rawValue && pcFinger == PcFinger.two2.rawValue) {
                pcScore += 1
                pcLabel.text = "win"
                playerLabel.text = ""
            } else {
                playerLabel.text = ""
                pcLabel.text = ""
            }
        }
        scoreLabel.text = "\(playerScore) : \(pcScore)"
        
        if playerScore == 5 && playerScore > pcScore {
            playerLabel.text = "此局贏家"
            oneButton.isEnabled = false
            twoButton.isEnabled = false
            threeButton.isEnabled = false
            fourButton.isEnabled = false
            fiveButton.isEnabled = false
        } else if pcScore == 5 && pcScore > playerScore {
            pcLabel.text = "此局贏家"
        }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        oneButton.isEnabled = true
        twoButton.isEnabled = true
        threeButton.isEnabled = true
        fourButton.isEnabled = true
        fiveButton.isEnabled = true
        playerScore = 0
        pcScore = 0
        scoreLabel.text = "\(playerScore) : \(pcScore)"
        playerLabel.text = "go"
        pcLabel.text = ""
    }
}

