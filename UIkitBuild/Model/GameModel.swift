//
//  GameModel.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-16.
//

import Foundation
struct GameModel {
    let Player1 = "X"
    let Player2 = "O"
    lazy var currentPlayer:String = self.getRandomPlayer()
    var winner = false
    var numOfTurns = 0 
    var gameBoard = [
        [0,0,0],
        [0,0,0],
        [0,0,0]
    ]
    var rowsValues:[Int] {
        return [
            gameBoard[0].reduce(.zero, +),
            gameBoard[1].reduce(.zero, +),
            gameBoard[2].reduce(.zero, +)
        ]
    }
    var columnValues:[Int]{
        return [
            gameBoard[0][0] + gameBoard[1][0] + gameBoard[2][0],
            gameBoard[0][1] + gameBoard[1][1] + gameBoard[2][1],
            gameBoard[0][2] + gameBoard[1][2] + gameBoard[2][2]
        ]
    }
    var diagonalValuesLtR:Int{
        return gameBoard[0][0] + gameBoard[1][1] + gameBoard[2][2]
    }
    var diagonalValuesRtL:Int{
        return gameBoard[0][2] + gameBoard[1][1] + gameBoard[2][0]
    }
    
    mutating func updateGameBoard(btnNumber num:Int){
        var row = 0
        var btnInRow = 0
        
        switch num {
        case 1,4,7:
            btnInRow = 0
        case 2,5,8:
            btnInRow = 1
        case 3,6,9:
            btnInRow = 2
        default:
            break
        }
        
        switch num {
        case 1,2,3:
            row = 0
        case 4,5,6:
            row = 1
        case 7,8,9:
            row = 2
        default:
            break
        }
        
        gameBoard[row][btnInRow] = currentPlayer == Player1 ? 1 : 5
        numOfTurns += 1
        if numOfTurns > 4 {
            checkForWinner(row: row,column:btnInRow)
            print(winner)
        }
        
    }
    
    mutating func checkForWinner(row:Int,column:Int){
        var winSum:Int{
            return currentPlayer == Player1 ? 3 : 15
        }
        if rowsValues[row] == winSum || columnValues[column] == winSum {
            winner = true
            return
        }
        if row == 0 && column == 0 || row == 2 && column == 2{
            if diagonalValuesLtR == winSum{
                winner = true
                return
            }
        }
        
        if row == 0 && column == 2 || row == 2 && column == 0{
            if diagonalValuesRtL == winSum{
                winner = true
                return
            }
        }
        if row == 1 && column == 1 {
            if rowsValues[row] == winSum || columnValues[column] == winSum
            || diagonalValuesLtR == winSum || diagonalValuesRtL == winSum{
                winner = true
                return
            }
        }
    }
   func getRandomPlayer() -> String{
    let randNum = Int.random(in: 0...10)
        print(randNum)
        var player = ""
    switch randNum {
    case 0...4:
        player = Player1
    default:
        player = Player2
    }
   return player
    }
}
