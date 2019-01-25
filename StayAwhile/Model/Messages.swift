//
//  Messages.swift
//  StayAwhile
//
//  Created by MacBook-Игорь on 25/01/2019.
//  Copyright © 2019 Riley Usagi. All rights reserved.
//

import Foundation

class Messages: Codable {
    static var array: [Message] = []
    
    static func loadMessagesFromFIR(complition: @escaping ([Message]) -> ()) {
        let query = Constants.refs.databaseChats.queryLimited(toLast: 100)
        
        _ = query.observe(.childAdded, with: { snapshot in
            
            if let data = snapshot.value as? [String: String],
                let text  = data["text"],
                let name  = data["name"],
                let id    = data["sender_id"],
                !text.isEmpty {
                
                let message = Message.init(text: text, name: name, senderId: id)
                self.array.append(message)
            }
            complition(self.array)
        })
    }
}
