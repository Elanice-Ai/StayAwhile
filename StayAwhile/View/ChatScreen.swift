import UIKit
import Magic

class ChatScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  /// Список всех сообщений
  var messages: [Message] = []
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var textInput: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate    = self
    tableView.dataSource  = self

    self.title = "Main chat"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    list { (messages) in
      self.messages = messages
      self.tableView.reloadData()
    }
  }
  
  func list(onSuccess: @escaping ([Message]) -> Void) {
    
    var messages = [Message]()
    
    let query = Constants.refs.databaseChats.queryLimited(toLast: 10)
    
    _ = query.observe(.childAdded, with: { snapshot in
      
      if let data = snapshot.value as? [String: String],
        let text  = data["text"],
        let name  = data["name"],
        let id    = data["sender_id"],
        !text.isEmpty {
        
        let message = Message(recievedText: text, recievedName: name, recievedSenderId: id)
        messages.append(message)
      }
      
      onSuccess(messages)
    })
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath)
    
    magic(messages[indexPath.row].name)
    
    if messages[indexPath.row].name == "Deep Thought" {
      cell.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.5)
    } else {
      cell.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 0.5)
    }
    
    cell.textLabel?.text = messages[indexPath.row].text
    cell.detailTextLabel?.text = messages[indexPath.row].name

    return cell
  }
}
