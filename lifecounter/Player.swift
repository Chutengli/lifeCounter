//
//  Player.swift
//  lifecounter
//
//  Created by Chuteng Li on 2022/4/29.
//

import Foundation

class Player {
    var score: Int
    var name: String
    
    init(_ score: Int, _ name: String) {
        self.score = score
        self.name = "player\(name)"
    }
    
    func add(_ num: Int) {
        self.score += num
    }
    
    func subtract(_ num: Int) {
        self.score -= num
    }
    
    
}
