import Foundation
import Magic

struct Message {
  var text: String
  var name: String
  var senderId: String
  
  init(recievedText: String, recievedName: String, recievedSenderId: String) {
    self.text     = recievedText
    self.name     = recievedName
    self.senderId = recievedSenderId
  }
}
