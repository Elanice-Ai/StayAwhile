import UIKit
import Magic

class ChatScreen: UIViewController {
  
  var messages: [Message] = [Message]()
  
  @IBOutlet var tableView: UITableView!
  
  @IBOutlet var textInput: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    tableView.delegate    = self
//    tableView.dataSource  = self

    let query = Constants.refs.databaseChats.queryLimited(toLast: 10)
    
    _ = query.observe(.childAdded, with: { snapshot in
      
      if let data = snapshot.value as? [String: String],
        let text  = data["text"],
        let name  = data["name"],
        let id    = data["sender_id"],
        !text.isEmpty {
        
        let message = Message(recievedText: text, recievedName: name, recievedSenderId: id)
        
        self.messages.append(message)
      }
    })
    
    magic(messages)
    
    self.title = "Main chat"
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath)

    
    
    cell.textLabel?.text = messages.first?.text
    cell.detailTextLabel?.text = messages.first?.name

    return cell
  }
  

  
}
