import Foundation
import FirebaseDatabase

extension Discussion {
  
  /// Парсер данных о Чатах
  ///
  /// - Parameter snapshot: Снимок данных из базы
  /// - Returns: Объект Чата
  class func mapper(snapshot: DataSnapshot) -> Discussion? {
    
    guard let json = snapshot.value as? [String: Any] else {
      return nil
    }
    
    let uid         = json["uid"] as? String ?? ""
    let title       = json["title"] as? String ?? ""
    let lastMessage = json["lastMessage"] as? String ?? ""
    
    return Discussion.init(uid: uid, title: title, lastMessage: lastMessage)
  }
}
