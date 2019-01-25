import Foundation

/// Объект беседы между пользователями
public class Discussion {
  
  /// Уникальный идентификатор пользователя
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
}
