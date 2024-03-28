import UIKit

final class WelcomeRouter {
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigateToLogin() {
        let vc = LoginBuilder.build()
        view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToRegistration() {
        let vc = RegistrationBuilder.build()
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
