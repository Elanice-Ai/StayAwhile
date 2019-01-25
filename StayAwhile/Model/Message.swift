import Foundation
import Magic

struct Message {
  var text: String
  var name: String
  var senderId: String
  
//  init(recievedText: String, recievedName: String, recievedSenderId: String) {
//    self.text     = recievedText
//    self.name     = recievedName
//    self.senderId = recievedSenderId
//  }
    
    static func send(_ message: String) {
        let ref = Constants.refs.databaseChats.childByAutoId()
        let message = ["sender_id": "igor", "name": "igor", "text": message]
        ref.setValue(message)
    }
    
}
