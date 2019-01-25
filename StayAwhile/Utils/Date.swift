import Foundation

extension Date {
  
  static func fromStringToDate(input: String, format: String) -> Date {
    let dateFormatter         = DateFormatter()
    dateFormatter.dateFormat  = format
    
    if let date = dateFormatter.date(from: input) {
      return date
    }
    
    return Date()
  }
  
  static func fromDateToString(date: Date, format: String) -> String {
    let dateFormatter         = DateFormatter()
    dateFormatter.dateFormat  = format
    let retString             = dateFormatter.string(from: date)
    
    return retString
  }
}
