//
//  MainViewController.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-22.
//

import UIKit
class MainViewController: UIViewController {
    var pVpBtn:UIButton!
    var pVcBtn:UIButton!
    var startGameBtn:UIButton!
    var startOnePlayerGameBtn:UIButton!
    
    var pVpContainer:UIView!
    var pVcContainer:UIView!
    
    var nameInput1:UITextField!
    var nameInput2:UITextField!
    
    var pVcBtnTop:NSLayoutConstraint!
    
    var nameInputOnePlayer:UITextField!
    
    var screenWidth = UIScreen.main.bounds.width < UIScreen.main.bounds.height ? UIScreen.main.bounds.width : UIScreen.main.bounds.height
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        setupView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //stuff here.
    }
    
    private func setupView(){
    //Instances and setup subviews
        pVpContainer = UIView()
        pVpContainer.translatesAutoresizingMaskIntoConstraints = false
        pVpContainer.backgroundColor = .clear
        pVpContainer.isUserInteractionEnabled = true
        pVpContainer.isHidden = true
        
      
        
        pVcContainer = UIView()
        pVcContainer.translatesAutoresizingMaskIntoConstraints = false
        pVcContainer.backgroundColor = .clear
        pVcContainer.isUserInteractionEnabled = true
        pVcContainer.isHidden = true
        
        pVpBtn = UIButton(type: .custom)
        pVpBtn.translatesAutoresizingMaskIntoConstraints = false
        pVpBtn.setTitle("2 Players", for: .normal)
        pVpBtn.backgroundColor = .lightGray
        pVpBtn.addTarget(self, action: #selector(twoPlayerGameInit), for: .touchUpInside)
            
        nameInput1 = UITextField(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/8))
        nameInput1.placeholder = "Enter Name"
        nameInput1.translatesAutoresizingMaskIntoConstraints = false
        
        nameInput2 = UITextField(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/8))
        nameInput2.placeholder = "Enter Name"
        nameInput2.translatesAutoresizingMaskIntoConstraints = false
        
        startGameBtn = UIButton(type: .custom)
        startGameBtn.setTitle("Start", for: .normal)
        startGameBtn.translatesAutoresizingMaskIntoConstraints = false
        startGameBtn.backgroundColor = .lightGray
        startGameBtn.addTarget(self, action: #selector(goToGame), for: .touchUpInside)
        
        startOnePlayerGameBtn = UIButton(type: .custom)
        startOnePlayerGameBtn.setTitle("Start", for: .normal)
        startOnePlayerGameBtn.translatesAutoresizingMaskIntoConstraints = false
        startOnePlayerGameBtn.backgroundColor = .lightGray
        startOnePlayerGameBtn.addTarget(self, action: #selector(goToGame), for: .touchUpInside)
        
        pVcBtn = UIButton(type: .custom)
        pVcBtn.setTitle("1 Player", for: .normal)
        pVcBtn.translatesAutoresizingMaskIntoConstraints = false
        pVcBtn.backgroundColor = .lightGray
        pVcBtn.addTarget(self, action: #selector(onePlayerGameInit), for: .touchUpInside)
        
        nameInputOnePlayer = UITextField(frame: CGRect(x: 0, y: 0, width: screenWidth/3, height: screenWidth/8))
        nameInputOnePlayer.placeholder = "Enter Name"
        nameInputOnePlayer.translatesAutoresizingMaskIntoConstraints = false
        
        pVcBtnTop = pVcBtn.topAnchor.constraint(equalTo: pVpBtn.bottomAnchor,constant: 20)
        
    //add views to main.
        pVpContainer.addSubview(nameInput1)
        pVpContainer.addSubview(nameInput2)
        pVpContainer.addSubview(startGameBtn)
        
        pVcContainer.addSubview(startOnePlayerGameBtn)
        pVcContainer.addSubview(nameInputOnePlayer)
        
        view.addSubview(pVcBtn)
        view.addSubview(pVpBtn)
        view.addSubview(pVpContainer)
        view.addSubview(pVcContainer)
        setupConstraints()
    }
    
  func setupConstraints(){
        NSLayoutConstraint.activate([
            //pvcContainer
            pVcContainer.leftAnchor.constraint(equalTo: view.leftAnchor,constant: screenWidth/3),
            pVcContainer.rightAnchor.constraint(equalTo: view.rightAnchor,constant: screenWidth/3 * -1),
            pVcContainer.topAnchor.constraint(equalTo: pVcBtn.bottomAnchor),
            pVcContainer.bottomAnchor.constraint(equalTo:startOnePlayerGameBtn.bottomAnchor,constant: 10),
            
            //pvpContainer
            pVpContainer.leftAnchor.constraint(equalTo: view.leftAnchor,constant: screenWidth/3),
            pVpContainer.rightAnchor.constraint(equalTo: view.rightAnchor,constant: screenWidth/3 * -1),
            pVpContainer.topAnchor.constraint(equalTo: pVpBtn.bottomAnchor),
            pVpContainer.bottomAnchor.constraint(equalTo:startGameBtn.bottomAnchor,constant: 10),
            
            //name box player 1
            nameInput1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameInput1.topAnchor.constraint(equalTo: pVpBtn.bottomAnchor,constant: 10),
            
            //name box player 2
            nameInput2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameInput2.topAnchor.constraint(equalTo: nameInput1.bottomAnchor,constant: 10),
            
            //name box single player
            nameInputOnePlayer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameInputOnePlayer.topAnchor.constraint(equalTo: pVcBtn.bottomAnchor,constant: 10),
            
            //start game button
            startGameBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: screenWidth/3),
            startGameBtn.rightAnchor.constraint(equalTo: view.rightAnchor,constant: screenWidth/3 * -1),
            startGameBtn.topAnchor.constraint(equalTo: nameInput2.bottomAnchor,constant: 10),
           
            //start singel player game button
            startOnePlayerGameBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: screenWidth/3),
            startOnePlayerGameBtn.rightAnchor.constraint(equalTo: view.rightAnchor,constant: screenWidth/3 * -1),
            startOnePlayerGameBtn.topAnchor.constraint(equalTo: nameInputOnePlayer.bottomAnchor,constant: 10),
            
            //2 players button
            pVpBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: screenWidth/3),
            pVpBtn.rightAnchor.constraint(equalTo: view.rightAnchor,constant: screenWidth/3 * -1),
            pVpBtn.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 100),
            
            //1 player button
            pVcBtn.leftAnchor.constraint(equalTo: view.leftAnchor,constant: screenWidth/3),
            pVcBtn.rightAnchor.constraint(equalTo: view.rightAnchor,constant: screenWidth/3 * -1),
            pVcBtnTop
        ])
    
    }
    
    @objc func goToGame(){
        //init VC
        let gameboard = self.storyboard?.instantiateViewController(withIdentifier: "GameBoard") as! GameBoardViewController
        
        //Check if input is empty. If not add player names
        if !nameInput1.text!.isEmpty {
            gameboard.game.player1 = nameInput1.text!
        }
        
        if !nameInput2.text!.isEmpty {
            gameboard.game.player2 = nameInput2.text!
        }
        
        //Navigate to VC
        self.navigationController!.pushViewController(gameboard, animated: true)
    }
    
    @objc func twoPlayerGameInit(){
        if pVpContainer.isHidden{
            pVpContainer.isHidden = false
            pVcBtnTop.constant += pVpContainer.frame.height
            updateViewConstraints()
            pVcBtn.updateConstraints()
            
        }else{
            pVpContainer.isHidden = true
            pVcBtnTop.constant -= pVpContainer.frame.height
            updateViewConstraints()
        }
    }
    @objc func onePlayerGameInit(){
        if pVcContainer.isHidden{
            pVcContainer.isHidden = false
        }else{
            pVcContainer.isHidden = true
         
        }
        
    }



    //toolbar hidden.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
