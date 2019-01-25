import Foundation

/// Схема работы с чатами
public protocol DiscussionManager {
  /// Список всех чатов пользователя
  ///
  /// - Parameters:
  ///   - onSuccess: Успешное замыкание
  ///   - onError: Замыкание в ходе ошибки
  func list(onSuccess: @escaping ([Discussion]) -> Void, onError: ErrorClosure?)
}
