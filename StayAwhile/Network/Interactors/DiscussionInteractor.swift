import Foundation

// Обработчик данных о беседах пользователей
public class DiscussionInteractor {
  
  var manager: DiscussionManager
  
  public init(manager: DiscussionManager) {
    self.manager = manager
  }
}
