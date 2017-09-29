//
//  ViewController.swift
//  yxt
//
//  Created by Arron Zhu on 16/11/20.
//  Copyright © 2016年 sundataonline. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftItem = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: #selector(leftButtonTapped))
        leftItem.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func leftButtonTapped() {
        let navController = self.navigationController as! NavigationController
        navController.showMenu()
    }
    
}

