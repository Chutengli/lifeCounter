//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Chuteng Li on 2022/5/1.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var textField: UITextView!
    
    var history = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = history
        

        // Do any additional setup after loading the view.
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
