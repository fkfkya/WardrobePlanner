import Foundation

final class LoginBuilder {
    static func build() -> LoginViewController {
        
        let vc = LoginViewController()
        let router = LoginRouter(view: vc)
        let presenter = LoginPresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
    
    static func build(email: String) -> LoginViewController {
        
        let vc = LoginViewController()
        vc.setEmailTextField(email: email)
        
        let router = LoginRouter(view: vc)
        let presenter = LoginPresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
}
