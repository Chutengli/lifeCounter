//
//  TableViewCell.swift
//  lifecounter
//
//  Created by Chuteng Li on 2022/4/30.
//

import UIKit

protocol TableViewCellProtocol: AnyObject {
    func plusButtonClicked(_ score: Int, _ degree: Int, _ player: Player)
    func minusButtonClicked(_ score: Int, _ degree: Int, _ player: Player)
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    
    var player: Player!
    var degree: Int = 1
    
    weak var delegate: TableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        player = nil
    }
    
    func configCell() {
        playerLabel.text = "\(player.score)"
    }
    
    @IBAction func plusButtonClicked(_ sender: Any) {
        
        player.add(Int(textField.text!) ?? degree)
        playerLabel.text = "\(player.score)"
        delegate?.plusButtonClicked(player.score, Int(textField.text!) ?? degree, player)
    }
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        player.subtract(Int(textField.text!) ?? degree)
        playerLabel.text = "\(player.score)"
        delegate?.minusButtonClicked(player.score, Int(textField.text!) ?? degree, player)
    }
    
}
