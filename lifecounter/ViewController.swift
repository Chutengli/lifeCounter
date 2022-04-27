//
//  ViewController.swift
//  lifecounter
//
//  Created by Chuteng Li on 2022/4/24.
//

import UIKit

let INITIAL_LIFE: Int = 20

class ViewController: UIViewController {
    @IBOutlet weak var playerOnePlusPressed: UIButton!
    @IBOutlet weak var playerOneMinusPressed: UIButton!
    @IBOutlet weak var playerOnePlusFive: UIButton!
    @IBOutlet weak var playerOneMinusFive: UIButton!
    @IBOutlet weak var playerOneLabel: UILabel!
    
    @IBOutlet weak var playerTwoPlus: UIButton!
    @IBOutlet weak var playerTwoMinus: UIButton!
    @IBOutlet weak var playerTwoPlusFive: UIButton!
    @IBOutlet weak var playerTwoMinusFive: UIButton!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    var player1: Int = INITIAL_LIFE {
        didSet {
            if (player1 <= 0) {
                showAlert("player1")
            }
        }
    }
    var player2: Int = INITIAL_LIFE {
        didSet {
            if (player2 <= 0) {
                showAlert("player2")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerOneLabel.text = String(player1)
        playerTwoLabel.text = String(player2)
        
    }
    
    
    @IBAction func button2PlusClicked(_ sender: UIButton) {
        player2 += 1
        playerTwoLabel.text = String(player2)
    }
    
    @IBAction func buttonMinusClicked(_ sender: UIButton) {
        player2 -= 1
        playerTwoLabel.text = String(player2)
    }
    
    @IBAction func buttonPlusFiveClicked(_ sender: UIButton) {
        player2 += 5
        playerTwoLabel.text = String(player2)
    }
    
    @IBAction func button2MinusFiveClicked(_ sender: UIButton) {
        player2 -= 5
        playerTwoLabel.text = String(player2)
    }
    
    @IBAction func button1PlusClicked(_ sender: UIButton) {
        player1 += 1
        playerOneLabel.text = String(player1)
    }
    
    @IBAction func button1MinusClicked(_ sender: UIButton) {
        player1 -= 1
        playerOneLabel.text = String(player1)
    }
    
    @IBAction func button1PlusFiveClicked(_ sender: UIButton) {
        player1 += 5
        playerOneLabel.text = String(player1)
    }
    
    @IBAction func button1MinusFiveClicked(_ sender: UIButton) {
        player1 -= 5
        playerOneLabel.text = String(player1)
    }
    
    
    
    
    @IBAction func showAlert(_ lost: String) {
        let alert = UIAlertController(title: "Result", message: "\(lost) has lost", preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
    }

}
