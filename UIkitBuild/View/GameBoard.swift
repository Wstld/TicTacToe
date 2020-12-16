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
    
    
    lazy var btn1:UIButton = {
        let btn1 = UIButton(type: .custom)
        btn1.backgroundColor = .blue
        btn1.translatesAutoresizingMaskIntoConstraints = false
        return btn1
        
    }()
    lazy var btn2:UIButton = {
        let btn2 = UIButton()
        btn2.backgroundColor = .green
        btn2.translatesAutoresizingMaskIntoConstraints = false
        btn2.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        btn2.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return btn2
    }()
    lazy var btn3:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        btn.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return btn
    }()
    lazy var btn4:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        btn.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return btn
    }()
    lazy var btn5:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        btn.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return btn
    }()
    lazy var btn6:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        btn.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return btn
    }()
    lazy var btn7:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        btn.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return btn
    }()
    lazy var btn8:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        btn.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return btn
    }()
    lazy var btn9:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        btn.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return btn
    }()
    
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            //btn1
            btn1.topAnchor.constraint(equalTo: topAnchor),
            btn1.leftAnchor.constraint(equalTo: leftAnchor),
            btn1.widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            btn1.heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn2
            btn2.topAnchor.constraint(equalTo: topAnchor),
            btn2.leftAnchor.constraint(equalTo: btn1.rightAnchor),
            btn2.widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            btn2.heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn3
            btn3.topAnchor.constraint(equalTo: topAnchor),
            btn3.leftAnchor.constraint(equalTo: btn2.rightAnchor),
            btn3.widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            btn3.heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn4
            btn4.topAnchor.constraint(equalTo: btn3.bottomAnchor),
            btn4.leftAnchor.constraint(equalTo: leftAnchor),
            btn4.widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            btn4.heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn5
            btn5.topAnchor.constraint(equalTo: btn2.bottomAnchor),
            btn5.leftAnchor.constraint(equalTo: btn4.rightAnchor),
            btn5.widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            btn5.heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn6
            btn6.topAnchor.constraint(equalTo: btn3.bottomAnchor),
            btn6.leftAnchor.constraint(equalTo: btn5.rightAnchor),
            btn6.widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            btn6.heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn7
            btn7.topAnchor.constraint(equalTo: btn4.bottomAnchor),
            btn7.leftAnchor.constraint(equalTo: leftAnchor),
            btn7.widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            btn7.heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn8
            btn8.topAnchor.constraint(equalTo: btn5.bottomAnchor),
            btn8.leftAnchor.constraint(equalTo: btn7.rightAnchor),
            btn8.widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            btn8.heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
            //btn9
            btn9.topAnchor.constraint(equalTo: btn6.bottomAnchor),
            btn9.leftAnchor.constraint(equalTo: btn8.rightAnchor),
            btn9.widthAnchor.constraint(equalToConstant: intrinsicContentSize.width/3),
            btn9.heightAnchor.constraint(equalToConstant: intrinsicContentSize.height/3),
        ])
    }
    private func setActions(){
        btn1.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        btn4.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        btn5.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        btn6.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        btn7.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        btn8.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        btn9.addTarget(self, action: #selector(addMarker), for: .touchUpInside)
        
    }
    @objc func addMarker(sender:UIButton){
       
        getPlayerAndSetMark(sender: sender)
    }

    private func getPlayerAndSetMark(sender:UIButton){
        clickAction!(sender)
    }
    override init(frame:CGRect){
        super.init(frame: frame)
            setupView()
            setActions()
    }
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
        setupView()
        setActions()
    }
    
    //common func to init our view
    private func setupView() {
        addSubview(btn1)
        addSubview(btn2)
        addSubview(btn3)
        addSubview(btn4)
        addSubview(btn5)
        addSubview(btn6)
        addSubview(btn7)
        addSubview(btn8)
        addSubview(btn9)
        self.isUserInteractionEnabled = true
        

        setConstraints()
    }
    
    override class var requiresConstraintBasedLayout: Bool {
       return true
     }
    override var intrinsicContentSize: CGSize{
        if frame.width != 0.0 || frame.height != 0.0  {
            return CGSize(width: frame.width, height: frame.height)
        }else {
            return CGSize(width: 300, height: 300)
        }
        
      }

}