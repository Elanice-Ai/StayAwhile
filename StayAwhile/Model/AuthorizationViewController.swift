//
//  AuthorizationViewController.swift
//  StayAwhile
//
//  Created by MacBook-Игорь on 25/01/2019.
//  Copyright © 2019 Riley Usagi. All rights reserved.
//

import UIKit
import Firebase

class AuthorizationViewController: UIViewController {

    //MARK: - Properties
    
    var actionTitle = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var authorizeButton: UIButton!
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.placeholder = "Enter login here"
        passwordTextField.placeholder = "Enter password here"
        titleLabel.text = actionTitle
        authorizeButton.setTitle(actionTitle, for: .normal)

    }
    
    //MARK: - Handlers
    
    @IBAction func authorizeButtonPressed(_ sender: UIButton) {
        if actionTitle == "Sign Up" {
            signUp()
        } else {
            signIn()
        }
    }
    
    func signIn() {
        guard let email = loginTextField.text, let password = passwordTextField.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
            if let error = error {
                print(error)
            } else {
                let chatViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChatScreen") as! ChatScreen
                
                //initial properties here
                
                self.navigationController?.pushViewController(chatViewController, animated: true)
            }
        }
    }
    
    func signUp() {
        guard let email = loginTextField.text, let password = passwordTextField.text else {return}
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if let error = error {
                print(error)
            } else {
                let chatViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChatScreen") as! ChatScreen
                
                //initial properties here
                
                self.navigationController?.pushViewController(chatViewController, animated: true)
            }
        }
    }
}
