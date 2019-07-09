//
//  Task.swift
//  UserInterface
//
//  Created by Will Nickson on 09/07/2019.
//  Copyright © 2019 find-my-face. All rights reserved.
//

import Foundation

struct Photographer{
    var username:String
    var id:String
    
    var dictionary: [String: Any] {
        return [
            "username": username,
        ]
    }
}

extension Photographer{
    init?(dictionary: [String : Any], id: String) {
        guard   let username = dictionary["username"] as? String
            else { return nil }
        
        self.init(username: username, id: id)
    }
}
