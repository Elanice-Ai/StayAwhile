import Foundation

/// Схема работы с пользователем
public protocol UserManager {
  
  /// Процесс регистрации пользователя
  ///
  /// - Parameters:
  ///   - user: Объект пользователя
  ///   - onSuccess: Замыкание при успешной регистрации
  ///   - onError: Замыкание при ошибке регистрации
  /// - Returns: Замыкание
  func register(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?)
  
  /// Процесс авторизации пользователя
  ///
  /// - Parameters:
  ///   - user: Объект пользователя
  ///   - onSuccess: Замыкание при успешной авторизации
  ///   - onError: Замыкание при ошибке авторизации
  /// - Returns: Замыкание
  func login(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?)
  
  /// Процесс восстановления пароля
  ///
  /// - Parameters:
  ///   - user: Объект пользователя
  ///   - onSuccess: Успешное замыкание
  ///   - onError: Замыкание в ходе ошбки
  /// - Returns: Замыкание
  func recoverPassword(user: User, onSuccess: @escaping (User) -> Void, onError: ErrorClosure?)
  
  /// Статус пользователя (авторизован или нет)
  ///
  /// - Parameters:
  ///   - onSuccess: Успешное замыкание
  ///   - onError: Замыкание в ходе ошибки
  /// - Returns: Замыкание
  func isLogged(onSuccess: @escaping (User?) -> Void, onError: ErrorClosure?)
  
  /// Вывод пользователя из системы
  ///
  /// - Parameters:
  ///   - onSuccess: Успешное замыкание
  ///   - onError: Замыкание в ходе ошибки
  func logout(onSuccess: @escaping () -> Void, onError: ErrorClosure?)
}
