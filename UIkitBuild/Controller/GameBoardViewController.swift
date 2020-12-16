//
//  ViewController.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-15.
//

import UIKit

class GameBoardViewController: UIViewController{
    let player = "X"
    var textLable:UILabel!
    override func loadView() {
        //Main Canvas.
        view = UIView()
        view.backgroundColor = .white
        let screen = UIScreen.main.bounds
       
        
        
        
        
        
        //Sub views instances and config.
        let gameBoard = GameBoard(frame: CGRect(x: 0, y: 0, width: screen.width - 30, height: screen.width - 30))
        gameBoard.translatesAutoresizingMaskIntoConstraints = false
        gameBoard.clickAction = { (btn:UIButton) in
             btn.setImage(UIImage(named: "symbolX.png"),for: .normal)
            }
        
      
        
        
        
        
        //Sub views added to main canvas.
        view.addSubview(gameBoard)
        
        //Constraints for all subviews.
        NSLayoutConstraint.activate([
            //gameboard
            gameBoard.topAnchor.constraint(equalTo: view.topAnchor,constant: screen.height * 0.2),
            gameBoard.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        
        view.bringSubviewToFront(gameBoard)
   
            
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    


}


