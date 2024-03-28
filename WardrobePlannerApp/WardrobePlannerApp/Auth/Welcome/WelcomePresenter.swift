import Foundation

final class WelcomePresenter {
    private weak var view: WelcomeViewController?
    private var router: WelcomeRouter
    
    init(view: WelcomeViewController?, router: WelcomeRouter) {
        self.view = view
        self.router = router
    }
    
    func registerButtonTapped() {
        UserDataManager.shared.setUserProcess(User.Process.registration)
        router.navigateToRegistration()
    }
    
    func loginButtonTapped() {
        UserDataManager.shared.setUserProcess(User.Process.authorization)
        router.navigateToLogin()
    }
}
