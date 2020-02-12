//
//  ViewController.swift
//  ToDoFire
//
//  Created by Artur Anissimov on 11.02.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    let segueIdentifier = "tasksSegue"
    
    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        warnLabel.alpha = 0
        
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: (self?.segueIdentifier)!, sender: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
        
    func displayWarningLabel(withText text: String) {
        warnLabel.text = text
        
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: { [weak self] in
            self?.warnLabel.alpha = 1
        }) { [weak self] complete in
            self?.warnLabel.alpha = 0
        }
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            if error != nil {
                self?.displayWarningLabel(withText: "Error occured")
                return
            }
            
            if user != nil {
                self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
                return
            }
            
            self?.displayWarningLabel(withText: "No such user")
        }
        
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                if user != nil {
                    
                } else {
                    print("user is not created")
                }
            } else {
                print(error!.localizedDescription)
            }
        }
    }
}


