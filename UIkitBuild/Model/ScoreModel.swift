//
//  ScoreModel.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-22.
//

import Foundation
struct ScoreModel {
    var player1:Int = 0
    var player2:Int = 0
    
    mutating func addWin(player:String){
        if player == "X" {
            player1 += 1
        }else{
            player2 += 1
        }
    }
}
