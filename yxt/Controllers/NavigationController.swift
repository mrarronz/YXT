//
//  NavigationController.swift
//  yxt
//
//  Created by Arron Zhu on 16/11/28.
//  Copyright © 2016年 sundataonline. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor.colorWithHexString(hex: "#039be5")
        navigationBar.barStyle = .black
        view.addGestureRecognizer(UIPanGestureRecognizer.init(target: self, action: #selector(panGestureRecognized(sender:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func panGestureRecognized(sender: UIPanGestureRecognizer) {
        view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.panGestureRecognized(sender)
    }

    func showMenu() {
        view.endEditing(true)
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
}
