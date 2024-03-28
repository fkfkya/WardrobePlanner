import Foundation
import FirebaseAuth

final class RegistrationPresenter {
    private weak var view: RegistrationViewController?
    private var router: RegistrationRouter
    
    init(view: RegistrationViewController?, router: RegistrationRouter) {
        self.view = view
        self.router = router
    }
    
    // MARK: - View To Presenter
    func backButtonTapped() {
        router.navigateToWellcome()
    }
    
    func signUpButtonTapped(email: String, password: String, secondPassword: String) {
        if (password != secondPassword ){
            self.view?.showAlert(message: "Please try enter passwords again!\n (They should be the same)")
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    self.view?.showAlert(message:"Failed to register user:\n" + error.localizedDescription)
                    return
                }
                
                if let user = authResult?.user {
                    user.sendEmailVerification { (error) in
                        if let error = error {
                            self.view?.showAlert(message:"Failed to send verification email:\n" + error.localizedDescription)
                            return
                        }
                    }
                } else { self.view?.showAlert(message:"User is not authenticated") }
            }
            router.navigateToSignIn(email: email)
        }
    }
    
}
