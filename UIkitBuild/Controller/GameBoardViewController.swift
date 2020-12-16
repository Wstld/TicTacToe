//
//  ViewController.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-15.
//

import UIKit

class GameBoardViewController: UIViewController{
    var game = GameModel()
    var textLable:UILabel!
    var gameOver = false
    override func loadView() {
        var currentPlayer = game.Player1
        
        //Main Canvas.
        view = UIView()
        view.backgroundColor = .white
        let screen = UIScreen.main.bounds
       
        //Sub views instances and config.
        let gameBoard = GameBoard(frame: CGRect(x: 0, y: 0, width: screen.width - 30, height: screen.width - 30))
        gameBoard.translatesAutoresizingMaskIntoConstraints = false
        
        //Set onClick action for gameboard
        gameBoard.clickAction = { (btn:UIButton) in
            if currentPlayer == self.game.Player1 {
                btn.setImage(UIImage(named: "symbolX.png"),for: .normal)
                btn.isUserInteractionEnabled = false
            }else{
                btn.setImage(UIImage(named: "rec.png"),for: .normal)
                btn.isUserInteractionEnabled = false
                
            }
            
            self.updateGameBoard(btnNumber: btn.tag,currentPlayer: currentPlayer)
            
            
            if currentPlayer == self.game.Player1 {
                currentPlayer = self.game.Player2
            }else{
                currentPlayer = self.game.Player1
            }
         
            }
        
        //Sub views added to main canvas.
        view.addSubview(gameBoard)
        
        //Constraints for all subviews.
        NSLayoutConstraint.activate([
            //gameboard
            gameBoard.topAnchor.constraint(equalTo: view.topAnchor,constant: screen.height * 0.2),
            gameBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
            
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    func updateGameBoard(btnNumber num:Int,currentPlayer:String){
        game.gameBoard[num] = currentPlayer == game.Player1 ? 1 : 5
        print(game.gameBoard)
    }
   
    


}


