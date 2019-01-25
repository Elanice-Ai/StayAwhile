import Foundation

/// Объект беседы между пользователями
public class Discussion {
  
  /// Уникальный идентификатор беседы
  var uid: String
  
  /// Заголовок чата
  var title: String
  
  /// Последнее сообщение
  var lastMessage: String
  
  init(uid: String, title: String, lastMessage: String){
    self.uid          = uid
    self.title        = title
    self.lastMessage  = lastMessage
  }
  
  convenience init(){
    self.init(uid: "", title: "", lastMessage: "")
  }
  
  public class func toDict(discussion: Discussion) -> [String: String] {
    
    let dateString = Date.fromDateToString(date: Date(), format: "yyyy-MM-dd HH:mm:ss")
    
    var dict = [String: String]()
    
    dict["uid"]         = discussion.uid
    dict["title"]       = discussion.title
    dict["lastMessage"] = discussion.lastMessage
    dict["dateString"]  = dateString
    
    return dict
  }
}
