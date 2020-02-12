//
//  ViewController.swift
//  ToDoFire
//
//  Created by Artur Anissimov on 11.02.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
        
    @IBAction func loginTapped(_ sender: UIButton) {
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
    }
    
    
}

