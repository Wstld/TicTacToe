//
//  ViewController.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-15.
//

import UIKit

class GameBoardViewController: UIViewController{
    var game = GameModel()
    var currentPlayerLable:UILabel!
    var gameBoard:GameBoard!
    var textLable:UILabel!
    var gameOver = false
    override func loadView() {
        
        //Main Canvas.
        view = UIView()
        view.backgroundColor = .white

        self.setupView(view:view)
 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    private func setupView(view:UIView){
        
        let screenWidth:CGFloat = UIScreen.main.bounds.width < UIScreen.main.bounds.height ? UIScreen.main.bounds.width : UIScreen.main.bounds.height
        
        //Sub views instances and config.
        gameBoard = GameBoard(frame: CGRect(x: 0, y: 0, width: screenWidth - 30, height: screenWidth - 30))
         gameBoard.translatesAutoresizingMaskIntoConstraints = false
 
        currentPlayerLable = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth/2, height: screenWidth/5))
        currentPlayerLable.text = game.currentPlayer
        currentPlayerLable.font = UIFont.systemFont(ofSize: 40.0)
        currentPlayerLable.translatesAutoresizingMaskIntoConstraints = false
        
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
            //Update current player lable text
            self.currentPlayerLable.text = self.game.currentPlayer
             }
         
         //Sub views added to main canvas.
         view.addSubview(gameBoard)
        view.addSubview(currentPlayerLable)
         
         //Constraints for all subviews.
         NSLayoutConstraint.activate([
             //gameboard
             gameBoard.topAnchor.constraint(equalTo: view.topAnchor,constant: UIScreen.main.bounds.height * 0.2),
             gameBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //current player lable
            currentPlayerLable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 10),
            currentPlayerLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
             
         ])
    }
    
    func resetGame(){
        //reset game logic
        game = GameModel()
        //reset view.
        currentPlayerLable.removeFromSuperview()
        gameBoard.removeFromSuperview()
        setupView(view: self.view)
    }
   

    


}


