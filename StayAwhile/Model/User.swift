import Foundation

public class User {
  
  /// Email пользователя
  public var email: String
  
  /// Пароль пользователя
  public var password: String?
  
  /// Общая информация пользователя
  public var sender: Sender
  
  init(id: String, email: String, password: String?){
    self.sender   = Sender.init(id: id, displayName: email)
    self.email    = email
    self.password = password
  }
}
