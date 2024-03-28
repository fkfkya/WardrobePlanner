import Foundation

final class WellcomeBuilder {
    static func build() -> WelcomeViewController {
        
        let vc = WelcomeViewController()
        let router = WelcomeRouter(view: vc)
        let presenter = WelcomePresenter(view: vc, router: router)
        
        vc.presenter = presenter
         
        return vc
    }
}
