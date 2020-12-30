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
    var scoreBoard = ScoreModel()
    
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
        player1NameLable.text = self.game.player1 + ":"
        
        player2NameLable = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/6))
        player2NameLable.translatesAutoresizingMaskIntoConstraints = false
        player2NameLable.font = UIFont.systemFont(ofSize: 30)
        player2NameLable.text = self.game.player2 + ":"
        
        player1ScoreLable = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/6))
        player1ScoreLable.font = UIFont.systemFont(ofSize: 30)
        player1ScoreLable.translatesAutoresizingMaskIntoConstraints = false
        player1ScoreLable.text = String(self.scoreBoard.player1)
        
        player2ScoreLable = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/6))
        player2ScoreLable.font = UIFont.systemFont(ofSize: 30)
        player2ScoreLable.translatesAutoresizingMaskIntoConstraints = false
        player2ScoreLable.text = String(self.scoreBoard.player2)
        
        
        
         //Set onClick action for gameboard
         gameBoard.clickAction = { (btn:UIButton) in
            //Marker logic for players
            if self.game.currentPlayer == self.game.player1 {
                btn.setImage(UIImage(named: "symbolX.png"),for: .normal)
                btn.isUserInteractionEnabled = false
            }else{
                btn.setImage(UIImage(named: "rec.png"),for: .normal)
                btn.isUserInteractionEnabled = false
                
            }
            //Updates game board array and checks for winner
            self.game.updateGameBoard(btnNumber: btn.tag)
            
          
            if self.game.winner {
                if self.game.currentPlayer == self.game.player1{
                    self.scoreBoard.addWin(player: "X")
                }else{
                    self.scoreBoard.addWin(player: "O")
                }
                
                // Show popup with winner
                self.showEndOfGameDialog(messageToUserd: "\(self.game.currentPlayer) won!")
              
            }
        
            
            if self.game.numOfTurns == 9 && !self.game.winner{
                //show popup with draw
                self.showEndOfGameDialog(messageToUserd: "It was a draw!")
                
            }
  
            //Alternates turns player vs player
                if self.game.currentPlayer == self.game.player1 {
                    self.game.currentPlayer = self.game.player2
                }else{
                    self.game.currentPlayer = self.game.player1
                }
            
            
            //Update current player lable text
            self.currentPlayerLable.text = self.game.currentPlayer
            
            //If solo game runs computers turn
            if self.game.soloPlayer && self.game.currentPlayer == self.game.player2 && self.game.numOfTurns < 9{
                let btn = self.game.computerTurn()
                let button = self.gameBoard.allBtns.filter{
                    button in return button.tag == btn
                    
                }
                button[0].sendActions(for: .touchUpInside)
            }
            
    }
         
         //Sub views added to main canvas.
         view.addSubview(gameBoard)
        view.addSubview(currentPlayerLable)
        view.addSubview(player2NameLable)
        view.addSubview(player1NameLable)
        view.addSubview(statsHeadline)
        view.addSubview(player2ScoreLable)
        view.addSubview(player1ScoreLable)
        
        //find widest player name (used to anchor score lables)
        var widestNameLable:UILabel {
            return player1NameLable.text!.count > player2NameLable.text!.count ? player1NameLable : player2NameLable
        }
        
         
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
            player2ScoreLable.leftAnchor.constraint(equalTo: widestNameLable.rightAnchor,constant: 15),
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
        if game.soloPlayer && game.currentPlayer == game.player2{
            let btn = game.computerTurn()
            
            let button = gameBoard.allBtns.filter{
                button in return button.tag == btn
            }
            
            button[0].sendActions(for: .touchUpInside)
        }
    }
    
    func showEndOfGameDialog(messageToUserd:String){
        let dialog = UIAlertController(title: messageToUserd, message:"play another round?" , preferredStyle: .alert)
        
        //Create alert btns
        let yesBtn = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            self.resetGame()
        }
        
        let noBtn = UIAlertAction(title: "No", style: .cancel) { (UIAlertAction) in
            let main = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            self.navigationController?.pushViewController(main, animated: true)

        }
        //add actions to dialog
        dialog.addAction(noBtn)
        dialog.addAction(yesBtn)
        
        
        
        //Show dialog
        self.present(dialog, animated: true, completion: nil)
    }
    
    func resetGame(){
        //reset game logic
        var newGame = GameModel()
        newGame.player1 = game.player1
        newGame.player2 = game.player2
        
        if game.soloPlayer {
            newGame.soloPlayer = true
        }
        
        game = newGame
        //reset view.
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        setupView(view: self.view)
    }
   

    


}


