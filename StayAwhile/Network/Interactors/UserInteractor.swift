import Foundation

/// Обработчик данных пользователя
public class UserInteractor {
  
  /// Сетевой менеджер для работы с данными пользователя
  var manager: UserManager
  
  public init(manager: UserManager) {
    self.manager = manager
  }
}
