import UIKit

struct AuthConstants {
    // MARK: - WelcomeViewController
    static let appNameTop: CGFloat = UIScreen.main.bounds.height / 3
    
    static let appNameOfSize: CGFloat = 35
    
    static let registerButtonBottom: CGFloat = 30
    static let registerCornerRadius: CGFloat = 30
    static let registerBorderWidth:CGFloat = 4
    
    static let loginButtonHeight: CGFloat = 25
    static let loginButtonBottom: CGFloat = UIScreen.main.bounds.height / 8
    
    // MARK: - EnterEmailViewController
    static let labelTop: CGFloat = UIScreen.main.bounds.height / 3
    static let signInButtonBottom: CGFloat = loginButtonBottom + loginButtonHeight + registerButtonBottom
}

