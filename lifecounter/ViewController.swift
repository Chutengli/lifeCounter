//
//  ViewController.swift
//  lifecounter
//
//  Created by Chuteng Li on 2022/4/24.
//

import UIKit

class ViewController: UIViewController, TableViewCellProtocol {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    
    var players: [Player] = []
    
    var history: String = ""
    
    
    func plusButtonClicked(_ score: Int, _ degree: Int, _ player: Player) {
        addButton.isEnabled = false
        removeButton.isEnabled = false
        
        
        history += "\(player.name) gained \(degree) score(s) \n"
        
    }
    
    func minusButtonClicked(_ score: Int, _ degree: Int, _ player: Player) {
        addButton.isEnabled = false
        removeButton.isEnabled = false
        
        for player in players {
            if (player.score <= 0) {
                let alert = UIAlertController(title: "Result", message: "\(player.name) is lost", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        history += "\(player.name) lost \(degree) score(s) \n"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...4 {
            players.append(Player(20, String(i)))
        }
                
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func historyButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "showHistory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistory" {
            if let hisVC = segue.destination as? HistoryViewController {
                hisVC.history = "\(history)"
            }
        }
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        players.append(Player(20, String(players.count)))
        tableView.reloadData()
    }
    
    @IBAction func removeButtonClicked(_ sender: Any) {
        players.remove(at: players.count - 1)
        tableView.reloadData()
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?
            TableViewCell {
            cell.player = players[indexPath.section]
            cell.configCell()
            cell.delegate = self
            return cell
        }
        
        return UITableViewCell()
            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }

}
