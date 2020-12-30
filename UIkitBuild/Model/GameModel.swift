//
//  GameModel.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-16.
//

import Foundation
struct GameModel {
    var soloPlayer = false
    var player1 = "X"
    var player2 = "O"
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
    
    func getRowAndColumn(_ num:Int) -> (row:Int,column:Int){
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
        return (row,btnInRow)
    }
    
    mutating func updateGameBoard(btnNumber num:Int){
        let move = getRowAndColumn(num)
      
        gameBoard[move.row][move.column] = currentPlayer == player1 ? 1 : 5
        
        numOfTurns += 1
        
        if numOfTurns > 4 {
            checkForWinner(row: move.row,column: move.column)
        }
        
    }
    
    mutating func checkForWinner(row:Int,column:Int){
        var winSum:Int{
            return currentPlayer == player1 ? 3 : 15
        }
        
        if rowsValues[row] == winSum || columnValues[column] == winSum {
            winner = true
            
        }
        if row == 0 && column == 0 || row == 2 && column == 2{
            if diagonalValuesLtR == winSum{
                winner = true
            }
        }
        
        if row == 0 && column == 2 || row == 2 && column == 0{
            if diagonalValuesRtL == winSum{
                winner = true
            }
        }
        if row == 1 && column == 1 {
            if rowsValues[row] == winSum || columnValues[column] == winSum
            || diagonalValuesLtR == winSum || diagonalValuesRtL == winSum{
                winner = true
            }
        }
        
    }
    
    mutating func computerTurn() -> Int{
        let randomInt = Int.random(in: 1...9)
        let move = getRowAndColumn(randomInt)
        if gameBoard[move.row][move.column] != 0 {
            return computerTurn()
        }
        
        return randomInt
    }
    
   func getRandomPlayer() -> String{
    let randNum = Int.random(in: 0...10)
        var player = ""
    switch randNum {
    case 0...4:
        player = player1
    default:
        player = player2
    }
   return player
    }
    
    
}
