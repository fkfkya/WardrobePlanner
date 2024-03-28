import UIKit

final class RegistrationRouter {
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigateToWellcome() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func navigateToSignIn(email: String) {
        let vc = LoginBuilder.build(email: email)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
