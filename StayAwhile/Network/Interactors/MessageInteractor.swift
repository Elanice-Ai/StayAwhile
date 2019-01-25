import Foundation

// Обработчик данных о Сообщении
public class MessageInteractor {
  
  var manager: MessageManager
  
  public init(manager: MessageManager) {
    self.manager = manager
  }
}
