//
//  User.swift
//  ToDoFire
//
//  Created by Artur Anissimov on 12.02.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit
import Firebase

struct User {
    
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
    
}
