import Foundation
import Magic

/// Объект сообщения
public class Message {
  
  /// Уникальный идентификатор сообщения (необходимость под вопросом)
  var uid: String
  
  /// Уникальный идентификатор беседы, к которой принадлежит сообщение
  var discussionUid: String
  
  /// Содержимое сообщения
  var text: String
  
  init(uid: String, discussionUid: String, text: String){
    self.uid            = uid
    self.discussionUid  = discussionUid
    self.text           = text
  }
  
  convenience init(){
    self.init(uid: "", discussionUid: "", text: "")
  }
}
