import Foundation

/// Объект группирует в себе данные о пользователе
public struct Sender {
  
  public let id: String
  public let displayName: String
  
  public init(id: String, displayName: String) {
    self.id = id
    self.displayName = displayName
  }
}

extension Sender: Equatable {
  public static func == (left: Sender, right: Sender) -> Bool {
    return left.id == right.id
  }
}
