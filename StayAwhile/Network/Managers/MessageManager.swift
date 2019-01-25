import Foundation

/// Схема работы с сообщениями
public protocol MessageManager {
  
  /// Чат к которому относится сообщение
  var discussion: Discussion { get set }
  
  init(discussion: Discussion)
  
  /// Список сообщений
  ///
  /// - Parameters:
  ///   - onSuccess: Успешное замыкание
  ///   - onError: Замыкание в ходе ошибки
  /// - Returns: Замыкание
  func list(onSuccess: @escaping ([Message]) -> Void, onError: ErrorClosure?)
  
  /// Отправка сообщения
  ///
  /// - Parameters:
  ///   - message: Сообщение
  ///   - onSuccess: Успешное замыкание
  ///   - onError: Замыкание в ходе ошибки
  func add(message: Message, onSuccess: @escaping () -> Void, onError: ErrorClosure?)
}
