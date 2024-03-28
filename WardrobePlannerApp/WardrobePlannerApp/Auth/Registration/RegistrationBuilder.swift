import Foundation

final class RegistrationBuilder {
    static func build() -> RegistrationViewController {
        
        let vc = RegistrationViewController()
        let router = RegistrationRouter(view: vc)
        let presenter = RegistrationPresenter(view: vc, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
}
