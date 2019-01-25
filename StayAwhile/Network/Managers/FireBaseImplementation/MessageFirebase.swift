import Foundation
import Firebase
import FirebaseDatabase
import Magic

public class MessageFirebase: MessageManager {
  
  public var discussion: Discussion
  var ref: DatabaseReference
  
  public required init(discussion: Discussion) {
    self.discussion = discussion
    self.ref = Database.database().reference().child("messages").child(self.discussion.uid)
  }
  
  public func list(onSuccess: @escaping ([Message]) -> Void, onError: ErrorClosure?) {
    
  }
  
  public func add(message: Message, onSuccess: @escaping () -> Void, onError: ErrorClosure?) {
    
  }
  
}
