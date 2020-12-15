//
//  ViewController.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-15.
//

import UIKit

class ViewController: UIViewController{
    
    var textLable:UILabel!
    override func loadView() {
        //Main Canvas.
        view = UIView()
        view.backgroundColor = .white
        
        //Sub views instances and config.
        textLable = UILabel()
        textLable.translatesAutoresizingMaskIntoConstraints = false
        textLable.text = "Hello World"
        textLable.textColor = .black
        textLable.font = UIFont.systemFont(ofSize: 24)
        
        let btn = UIButton(type:.roundedRect)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .gray
        btn.setTitle("TEST", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        view.addSubview(btn)
        
        
        
        
        //Sub views added to main canvas.
        view.addSubview(textLable)
        
        //Constraints for all subviews.
        NSLayoutConstraint.activate([
            //Textlable constraints
            textLable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            textLable.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            //Btn Constraints
            btn.centerYAnchor.constraint(equalTo: textLable.bottomAnchor, constant: 70),
            btn.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            btn.widthAnchor.constraint(equalToConstant: 100),
            btn.heightAnchor.constraint(equalToConstant: 100)
            
            
        ])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    


}


