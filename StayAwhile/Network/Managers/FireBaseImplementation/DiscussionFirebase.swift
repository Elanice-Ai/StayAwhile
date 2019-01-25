import Foundation
import Firebase
import FirebaseDatabase

public class DiscussionFirebase: DiscussionManager {
  
  var ref = Database.database().reference().child("discussions")
  
  public func list(onSuccess: @escaping ([Discussion]) -> Void, onError: ErrorClosure?) {
    
    self.ref.observe(.value, with: { (snapshot) in
      
      let discussions = snapshot.children
        .compactMap({ Discussion.mapper(snapshot: $0 as! DataSnapshot) })
        .sorted(by: { $0.uid > $1.uid })
      
      onSuccess(discussions)
      
    }) { (error) in
      print(error)
    }
  }
  
  
  public func add(discussion: Discussion, onSuccess: @escaping () -> Void, onError: ErrorClosure?) {
    
    // TODO: Title is a user's name

    let child = Discussion.toDict(discussion: discussion)


    ref.child(child["uid"]!).updateChildValues(child) { (error, _) in
      if let err = error, let retError = onError {
        retError(err)
      }
      onSuccess()
    }
  }
  
  

}
