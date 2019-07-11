//
//  TabBarControllerViewController.swift
//  UserInterface
//
//  Created by Laura Quinn on 2019-07-11.
//  Copyright © 2019 find-my-face. All rights reserved.
//

import UIKit

class TabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = HomeController()
        
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let favVC = FavouritesController()
        
        favVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        let tabBarList = [homeVC, favVC]
        
        viewControllers = tabBarList
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
