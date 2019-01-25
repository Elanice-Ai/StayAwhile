import UIKit
import Magic

/// Экран авторизации/регистрации
class LoginScreen: UIViewController {
  
  // MARK: Свойства
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  // MARK: Жизненный цикл
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let manager = UserInteractor(manager: UserFirebase()).manager
    
    // Если пользователь уже авторизован, то перекидываем его на страницу со списком чатов
    manager.isLogged(onSuccess: { (user) in
      if let u = user {
        self.navigateToDiscussions(user: u)
      }
    }, onError: nil)

    // TODO: Event logs
  }
  
  
  /// Переход на страницу чатов
  ///
  /// - Parameter user: Пользователь, чаты которого должны будут отобразиться
  func navigateToDiscussions(user: User) {
    
    // TODO: Event logs
    
    // Процесс перехода
    if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DiscussionsScreen") as? DiscussionsScreen {
      
      // Передаём данные о пользователе на экран со списком чатов
      if let navigator = navigationController {
        viewController.user = user
        navigator.pushViewController(viewController, animated: true)
      }
    }
  }
  
  /// Алерт
  ///
  /// - Parameters:
  ///   - title: Заголовок
  ///   - message: Сообщение
  func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alertController, animated: true, completion: nil)
  }
  
  /// Нажатие кнопки "Войти"
  ///
  /// - Parameter sender: Отправитель сообщения
  @IBAction func loginClicked(_ sender: Any) {
    
    guard let email = emailField.text else {
      return
    }
    
    guard let password = passwordField.text else{
      return
    }
    
    let user = User(id: "", email: email, password: password)
    
    let manager = UserInteractor.init(manager: UserFirebase()).manager
    
    manager.login(user: user, onSuccess: { (user) in
      self.navigateToDiscussions(user: user)
    }) { (error) in
      self.showAlert(title: "Error", message: error.localizedDescription)
    }
  }
  
  /// Нажатие кнопки "Зарегистрироваться"
  ///
  /// - Parameter sender: Отправитель сообщения
  @IBAction func registerClicked(_ sender: Any) {
    
    guard let email = emailField.text else {
      return
    }
    
    guard let password = passwordField.text else{
      return
    }
    
    let user = User(id: "", email: email, password: password)
    
    let manager = UserInteractor(manager: UserFirebase()).manager
    
    manager.register(user: user, onSuccess: { (user) in
      self.navigateToDiscussions(user: user)
    }) { (error) in
      self.showAlert(title: "Error", message: error.localizedDescription)
    }
  }
  
  /// Нажатие кнопки "Восстановить пароль"
  ///
  /// - Parameter sender: Отправитель сообщения
  @IBAction func recoverClicked(_ sender: Any) {
    
    guard let email = emailField.text else {
      return
    }
    
    let user = User(id: "", email: email, password: nil)
    
    let manager = UserInteractor.init(manager: UserFirebase()).manager
    manager.recoverPassword(user: user, onSuccess: { (user) in
      self.showAlert(title: "Password", message: "Password recovered")
    }) { (error) in
      self.showAlert(title: "Error", message: error.localizedDescription)
    }
  }
}
