//
//  MessageCell.swift
//  FlashChat
//
//  Created by MacBook-Игорь on 24/12/2018.
//  Copyright © 2018 MacBook-Игорь. All rights reserved.
//

import UIKit

class IncomeMessageCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    
    func configureCellWith(_ data: Message) {
        profileImage.layer.cornerRadius = 15
//        messageView.layer.cornerRadius = 5
        
        messageBody.text = data.text
    }
    
}
