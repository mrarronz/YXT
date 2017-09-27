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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
