//
//  LoginController.swift
//  UserInterface
//
//  Created by Will Nickson on 09/07/2019.
//  Copyright © 2019 find-my-face. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        let inputsContainerView = UIView()
        inputsContainerView.backgroundColor = UIColor.white
        
        inputsContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputsContainerView)
        
        view.addSubview(inputsContainerView)
        
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .lightContent
    }

}

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
