import UIKit

final class LoginRouter {
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigateToWellcome() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func navigateToWardrobe() {
       
    }
}
