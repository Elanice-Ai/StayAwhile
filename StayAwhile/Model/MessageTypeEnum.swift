import Foundation

/// Тип сообщения
///
/// - text: Текст (включая стикеры)
/// - image: Изображение
/// - sound: Аудиозапись
/// - video: Видеозапись
/// - location: Текущая локация
enum MessageTypeEnum: String {
  case text     = "text"
  case image    = "image"
  case sound    = "sound"
  case video    = "video"
  case location = "location"
}
