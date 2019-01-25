import Foundation
import Firebase

struct Constants {
  struct refs {
    /// Корень базы данных в FireBase
    static let databaseRoot  = Database.database().reference()
    
    /// Список чатов в FireBase
    static let databaseDiscussions = databaseRoot.child("discussions")
  }
}
