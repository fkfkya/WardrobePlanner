import Foundation
import FirebaseAuth

final class LoginPresenter {
    private weak var view: LoginViewController?
    private var router: LoginRouter
    
    init(view: LoginViewController?, router: LoginRouter) {
        self.view = view
        self.router = router
    }
    
    // MARK: - View To Presenter
    func backButtonTapped() {
        router.navigateToWellcome()
    }
    
    func loginButtonTapped(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.view?.showAlert(message: "Failed to sign in user!" + error.localizedDescription)
            }
            
            if let user = authResult?.user {
                if user.isEmailVerified {
                    self.view?.showAlert(message:"User signed in successfully")
                } else {
                    // TODO
                    self.view?.showAlert(message:"Not verified account")
                }
            }
        }
    }
    
    func forgotPasswordButtonTapped(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                self.view?.showAlert(message: "Failed to send password reset email. Please try again.")
            } else {
                self.view?.showAlert(message: "Password reset email sent successfully. Please check your inbox.")
            }
        }
    }
    
    
}
