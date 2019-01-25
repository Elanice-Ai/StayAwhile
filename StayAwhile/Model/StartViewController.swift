//
//  StartViewController.swift
//  StayAwhile
//
//  Created by MacBook-Игорь on 25/01/2019.
//  Copyright © 2019 Riley Usagi. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet var buttonsAppereance: [UIButton]!
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Handlers
    
    @IBAction func nextScreenTransition(_ sender: UIButton) {
        let destinationViewController = storyboard?.instantiateViewController(withIdentifier: "AuthorizationViewController") as! AuthorizationViewController
        destinationViewController.actionTitle = sender.tag == 1000 ? "Sign In" : "Sign Up"
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
}
