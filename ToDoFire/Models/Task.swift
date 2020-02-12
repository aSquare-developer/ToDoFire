//
//  Task.swift
//  ToDoFire
//
//  Created by Artur Anissimov on 12.02.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit
import Firebase

struct Task {
    
    let title: String
    let userId: String
    let ref: DatabaseReference?
    var completed: Bool = false
    
    init(title: String, userId: String) {
        self.title = title
        self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        userId = snapshotValue["userId"] as! String
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
}
