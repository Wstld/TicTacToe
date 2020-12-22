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
    
    var statsHeadline:UILabel!
    
    var player1NameLable:UILabel!
    var player2NameLable:UILabel!
    
    var player1ScoreLable:UILabel!
    var player2ScoreLable:UILabel!
    
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
        
        statsHeadline = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/6))
        statsHeadline.translatesAutoresizingMaskIntoConstraints = false
        statsHeadline.font = UIFont.systemFont(ofSize: 40)
        statsHeadline.text = "Score"
        
        player1NameLable = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/6))
        player1NameLable.translatesAutoresizingMaskIntoConstraints = false
        player1NameLable.font = UIFont.systemFont(ofSize: 30)
        player1NameLable.text = self.game.Player1 + ":"
        
        player2NameLable = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/6))
        player2NameLable.translatesAutoresizingMaskIntoConstraints = false
        player2NameLable.font = UIFont.systemFont(ofSize: 30)
        player2NameLable.text = self.game.Player2 + ":"
        
        player1ScoreLable = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/6))
        player1ScoreLable.font = UIFont.systemFont(ofSize: 30)
        player1ScoreLable.translatesAutoresizingMaskIntoConstraints = false
        player1ScoreLable.text = "10"
        
        player2ScoreLable = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/6))
        player2ScoreLable.font = UIFont.systemFont(ofSize: 30)
        player2ScoreLable.translatesAutoresizingMaskIntoConstraints = false
        player2ScoreLable.text = "10"
        
        
        
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
        view.addSubview(player2NameLable)
        view.addSubview(player1NameLable)
        view.addSubview(statsHeadline)
        view.addSubview(player2ScoreLable)
        view.addSubview(player1ScoreLable)
         
         //Constraints for all subviews.
         NSLayoutConstraint.activate([
            //current player lable
            currentPlayerLable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 10),
            currentPlayerLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //gameboard
            gameBoard.topAnchor.constraint(equalTo: currentPlayerLable.bottomAnchor,constant: 15),
             gameBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           
            //player2 name lable
            player2NameLable.bottomAnchor.constraint(equalTo:view.layoutMarginsGuide.bottomAnchor,constant: screenWidth * -0.1),
            player2NameLable.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            //player 2 score lable
            player2ScoreLable.leftAnchor.constraint(equalTo: player2NameLable.rightAnchor,constant: 15),
            player2ScoreLable.bottomAnchor.constraint(equalTo: player2NameLable.bottomAnchor),
            
            //player1 name lable
            player1NameLable.bottomAnchor.constraint(equalTo:player2NameLable.topAnchor,constant: 10 ),
            player1NameLable.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            //player 1 score lable
            player1ScoreLable.leftAnchor.constraint(equalTo: player2ScoreLable.leftAnchor),
            player1ScoreLable.bottomAnchor.constraint(equalTo: player1NameLable.bottomAnchor),
            
            //Stats Headline lable
            statsHeadline.bottomAnchor.constraint(equalTo: player1NameLable.topAnchor,constant: 10),
            statsHeadline.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor)
             
         ])
    }
    
    func resetGame(){
        //reset game logic
        game = GameModel()
        //reset view.
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        setupView(view: self.view)
    }
   

    


}


