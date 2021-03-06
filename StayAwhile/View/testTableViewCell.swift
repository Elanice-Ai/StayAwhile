//
//  testTableViewCell.swift
//  StayAwhile
//
//  Created by MacBook-Игорь on 24/01/2019.
//  Copyright © 2019 Riley Usagi. All rights reserved.
//

import UIKit

class OutcomeMessageCell: UITableViewCell {


    @IBOutlet weak var messageBody: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    func configureCellWith(_ data: Message) {
        profileImage.layer.cornerRadius = 15
        //        messageView.layer.cornerRadius = 5
        
        messageBody.text = data.text
    }
}
