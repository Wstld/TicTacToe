//
//  ViewController.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-15.
//

import UIKit

class GameBoardViewController: UIViewController{
    var game = GameModel()
    var gameBoard:GameBoard!
    var textLable:UILabel!
    var gameOver = false
    override func loadView() {
        
        //Main Canvas.
        view = UIView()
        view.backgroundColor = .white
        self.setupGameboard(view:view)
      
            
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
   
    func resetGame(){
        //reset game logic
        game = GameModel()
        //reset view.
        gameBoard.removeFromSuperview()
        setupGameboard(view: self.view)
    }
    
    private func setupGameboard(view:UIView){
         //Sub views instances and config.
         gameBoard = GameBoard(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.width - 30))
         gameBoard.translatesAutoresizingMaskIntoConstraints = false
         
         //Set onClick action for gameboard
         gameBoard.clickAction = { (btn:UIButton) in
            //Marker logic for players
            if self.game.currentPlayer == self.game.Player1 {
                btn.setImage(UIImage(named: "symbolX.png"),for: .normal)
                btn.isUserInteractionEnabled = false
            }else{
                btn.setImage(UIImage(named: "rec.png"),for: .normal)
                btn.isUserInteractionEnabled = false
                
            }
            //Updates game board array and checks for winner
            self.game.updateGameBoard(btnNumber: btn.tag)
            if self.game.winner {
                //show new screen with winner popup and wanna play again.
                self.resetGame()
            }else if self.game.numOfTurns >= 9 && !self.game.winner {
                //show popup with draw and options to play again.
                self.resetGame()
                
            }
  
            //Alternates turns
            if self.game.currentPlayer == self.game.Player1 {
                self.game.currentPlayer = self.game.Player2
            }else{
                self.game.currentPlayer = self.game.Player1
            }
             }
         
         //Sub views added to main canvas.
         view.addSubview(gameBoard)
         
         //Constraints for all subviews.
         NSLayoutConstraint.activate([
             //gameboard
             gameBoard.topAnchor.constraint(equalTo: view.topAnchor,constant: UIScreen.main.bounds.height * 0.2),
             gameBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor)
             
         ])
    }
   

    


}


