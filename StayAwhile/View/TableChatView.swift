import UIKit
import Magic

class TableChatView: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var messages: [Int] = [1,2,3,4,5,6,7,8,9,10]
  
  @IBOutlet var tableView: UITableView!
  
  @IBOutlet var textInput: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate    = self
    tableView.dataSource  = self
    
    self.title = "CHATS"
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath)

    cell.textLabel?.text = "Hello"
    cell.detailTextLabel?.text = "by Riley"
    
    return cell
  }
}
