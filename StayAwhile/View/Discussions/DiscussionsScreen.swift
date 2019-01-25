import UIKit
import Magic

/// Экран со списком чатов
class DiscussionsScreen: UIViewController {
  
  // MARK: - Свойства
  var user: User!
  var discussions: [Discussion] = [Discussion]()
  @IBOutlet weak var discussionsTable: UITableView!
  
  // MARK: - Жизненный цикл
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let _ = user else {
      return
    }
    
    self.navigationItem.hidesBackButton = true
    
    let logoutButton = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.done, target: self, action: #selector(DiscussionsScreen.logout(sender:)))
    
    self.navigationItem.leftBarButtonItem = logoutButton
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.initFetch()
  }
  
  // MARK: - Навигация
  @objc func logout(sender: UIBarButtonItem) {
    
    // TODO: Event logs
    
    let manager = UserInteractor.init(manager: UserFirebase()).manager
    manager.logout(onSuccess: {
      self.navigationController?.popViewController(animated: true)
    }) { (error) in
      print(error)
      self.navigationController?.popViewController(animated: true)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier != nil {
      
      let selectedIndex   = self.discussionsTable.indexPathsForSelectedRows?.last?.item
      let discussion      = discussions[selectedIndex!]
      let vc              = segue.destination as! ChatScreen
      vc.actualDiscussion = discussion
      vc.user = user
      
      // TODO: Event logs
    }
  }
  
}
