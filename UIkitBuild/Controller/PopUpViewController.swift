//
//  PopUpViewController.swift
//  UIkitBuild
//
//  Created by Pontus Westlund on 2020-12-22.
//

import UIKit
class PopUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        var screenWidth = UIScreen.main.bounds.width < UIScreen.main.bounds.height ? UIScreen.main.bounds.width : UIScreen.main.bounds.height
        view = UIView()
        view.backgroundColor = .clear
    }

}
