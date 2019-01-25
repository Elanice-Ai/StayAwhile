import UIKit
import Magic

// MARK: - Расширение для табличного экрана с реализацией базовых методов
extension DiscussionsScreen: UITableViewDelegate, UITableViewDataSource {
  
  func initFetch(){
    
    self.discussionsTable.delegate    = self
    self.discussionsTable.dataSource  = self
    
    let manager = DiscussionInteractor.init(manager: DiscussionFirebase()).manager
    
    manager.list(onSuccess: { (discussions) in
      self.discussions = discussions
      self.discussionsTable.reloadData()
    }) { (error) in
      magic(error)
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.discussions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "discussionCell", for: indexPath) as? DiscussionCell else {
      return DiscussionCell()
    }
    
    cell.discussion = discussions[indexPath.row]
    
    return cell
  }
}
