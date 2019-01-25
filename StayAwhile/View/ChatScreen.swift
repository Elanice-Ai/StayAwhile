import UIKit
import Magic

class ChatScreen: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textInput: UITextField!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Messages.loadMessagesFromFIR { _ in
            self.configureTableView()
            let indexPath = IndexPath(row: Messages.array.count - 1, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        tableView.delegate    = self
        tableView.dataSource  = self
        
        self.title = "Main chat"
        
        configureTableView()
        
        tableView.register(UINib(nibName: "IncomeMessageCell", bundle: nil), forCellReuseIdentifier: "IncomeMessageCell")
        tableView.register(UINib(nibName: "OutcomeMessageCell", bundle: nil), forCellReuseIdentifier: "OutcomeMessageCell")
    }
    
    // MARK: - Handlers
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        //TODO: - send button is only available when inputText is not empty
        guard let messageBody = textInput.text else {return}
        Message.send(messageBody)
        textInput.text = ""
    }
}

//MARK: - TableView Delegate ans DataSource Methods

extension ChatScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Messages.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //TODO: - After Auth will be available change hardcoded "igor" to something like Auth.auth().currentUser?.email
        
        //TODO: - We can define two more additional cells for state where above messages present without avatar
        
        if Messages.array[indexPath.row].senderId != "igor" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeMessageCell", for: indexPath) as! IncomeMessageCell
            cell.configureCellWith(Messages.array[indexPath.row])
            return cell
        } else if Messages.array[indexPath.row].senderId == "igor" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OutcomeMessageCell", for: indexPath) as! OutcomeMessageCell
            cell.configureCellWith(Messages.array[indexPath.row])
            return cell
        } else {
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 37.0
    }
}
