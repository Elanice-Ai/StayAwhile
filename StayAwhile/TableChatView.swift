import UIKit
import Magic

class TableChatView: UIViewController, UITableViewDelegate, UITableViewDataSource {

  var messages: [[String: String]] = []
  
  @IBOutlet var tableView: UITableView!
  
  @IBOutlet var textInput: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate    = self
    tableView.dataSource  = self
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "chatMessage", for: indexPath)

    cell.textLabel?.text = "Hello"
    cell.detailTextLabel?.text = "by Riley"
    
    return cell
  }
}
