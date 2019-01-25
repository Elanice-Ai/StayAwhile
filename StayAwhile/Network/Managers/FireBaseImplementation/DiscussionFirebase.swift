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
}
