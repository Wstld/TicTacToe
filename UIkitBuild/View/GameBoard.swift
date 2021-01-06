//
//  GameBoard.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-15.
//

import Foundation
import UIKit
class GameBoard: UIView {
    var clickAction:((UIButton) -> Void)?
    let screenSize = UIScreen.main.bounds
    var allBtns = [UIButton]()
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            //btn1
            allBtns[0].topAnchor.constraint(equalTo: topAnchor),
            allBtns[0].leftAnchor.constraint(equalTo: leftAnchor),
            allBtns[0].widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            allBtns[0].heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn2
            allBtns[1].topAnchor.constraint(equalTo: topAnchor),
            allBtns[1].leftAnchor.constraint(equalTo: allBtns[0].rightAnchor),
            allBtns[1].widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            allBtns[1].heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn3
            allBtns[2].topAnchor.constraint(equalTo: topAnchor),
            allBtns[2].leftAnchor.constraint(equalTo: allBtns[1].rightAnchor),
            allBtns[2].widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            allBtns[2].heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn4
            allBtns[3].topAnchor.constraint(equalTo: allBtns[2].bottomAnchor),
            allBtns[3].leftAnchor.constraint(equalTo: leftAnchor),
            allBtns[3].widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            allBtns[3].heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn5
            allBtns[4].topAnchor.constraint(equalTo: allBtns[1].bottomAnchor),
            allBtns[4].leftAnchor.constraint(equalTo: allBtns[3].rightAnchor),
            allBtns[4].widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            allBtns[4].heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn6
            allBtns[5].topAnchor.constraint(equalTo: allBtns[2].bottomAnchor),
            allBtns[5].leftAnchor.constraint(equalTo: allBtns[4].rightAnchor),
            allBtns[5].widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            allBtns[5].heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn7
            allBtns[6].topAnchor.constraint(equalTo: allBtns[3].bottomAnchor),
            allBtns[6].leftAnchor.constraint(equalTo: leftAnchor),
            allBtns[6].widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            allBtns[6].heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn8
            allBtns[7].topAnchor.constraint(equalTo: allBtns[4].bottomAnchor),
            allBtns[7].leftAnchor.constraint(equalTo: allBtns[6].rightAnchor),
            allBtns[7].widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            allBtns[7].heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn9
            allBtns[8].topAnchor.constraint(equalTo: allBtns[5].bottomAnchor),
            allBtns[8].leftAnchor.constraint(equalTo: allBtns[7].rightAnchor),
            allBtns[8].widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            allBtns[8].heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
        ])
    }
    private func setActions(){
        allBtns.forEach{
            btn in
            btn.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        }
    }
    
    private func addAllBtnsToArray(){
        for i in 1...9 {
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.tag = i
            allBtns.append(btn)
        }
        
    }
    @objc func addMarker(sender:UIButton){
        getPlayerAndSetMark(sender: sender)
    }

    private func getPlayerAndSetMark(sender:UIButton){
        clickAction!(sender)
    }
    override init(frame:CGRect){
        super.init(frame: frame)
            addAllBtnsToArray()
            setupView()
            setActions()
            
    }
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        addAllBtnsToArray()
        setupView()
        setActions()
        
    }
    
    //common func to init our view
    private func setupView() {
        allBtns.forEach{
            btn in
           addSubview(btn)
        }
        self.isUserInteractionEnabled = true
        setupBtns()
        setConstraints()
    }
    
    // setup btn apperance
    func setupBtns(){
        allBtns.forEach{
            btn in
            btn.layer.borderWidth = 1.0
            btn.layer.borderColor = UIColor.white.cgColor
            btn.layer.shadowColor = UIColor.black.cgColor
            btn.layer.shadowOpacity = 0.3
            btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            btn.layer.cornerRadius = 10
            btn.clipsToBounds = true
            
        }
    }
    
    override class var requiresConstraintBasedLayout: Bool {
       return true
     }
    
    // if no size is specified on init.
    override var intrinsicContentSize: CGSize{
        if frame.width != 0.0 || frame.height != 0.0  {
            return CGSize(width: frame.width, height: frame.height)
        }else {
            return CGSize(width: 300, height: 300)
        }
        
      }

}
