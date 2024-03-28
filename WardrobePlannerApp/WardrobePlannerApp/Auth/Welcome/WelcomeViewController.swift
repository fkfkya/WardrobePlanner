import UIKit

final class WelcomeViewController: UIViewController {
    
    var presenter: WelcomePresenter?
    
    private let appName: UILabel = UILabel()
    private let registerButton: UIButton = UIButton(type: .system)
    private let loginButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - View To Presenter
    @objc
    private func registerButtonTapped() {
        presenter?.registerButtonTapped()
    }
    
    @objc
    private func loginButtonTapped() {
        presenter?.loginButtonTapped()
    }
}

// MARK: - UI Configuration
extension WelcomeViewController {
    
    private func configureUI() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        configureAppName()
        configureLoginButton()
        configureRegisterButton()
    }
    
    private func configureAppName() {
        view.addSubview(appName)
        appName.translatesAutoresizingMaskIntoConstraints = false
        
        appName.text = "Wardrobe Planner"
        appName.font = UIFont.systemFont(ofSize: AuthConstants.appNameOfSize, weight: .heavy)
        
        appName.pinTop(to: view.topAnchor, AuthConstants.appNameTop)
        appName.pinCenterX(to: view.centerXAnchor)
    }
    
    private func configureRegisterButton() {
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        registerButton.setTitle("Sign up", for: .normal)
        registerButton.setTitleColor(UIColor(named: "customPurple"), for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        registerButton.layer.borderColor = UIColor(named: "customPurple")?.cgColor
        registerButton.layer.borderWidth = AuthConstants.registerBorderWidth
        registerButton.layer.cornerRadius = AuthConstants.registerCornerRadius
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        registerButton.pinBottom(to: loginButton.topAnchor, AuthConstants.registerButtonBottom)
        registerButton.pinCenterX(to: view.centerXAnchor)
        registerButton.setHeight(60)
        registerButton.setWidth(230)
    }
    
    private func configureLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.setTitle("Sign in", for: .normal)
        loginButton.setTitleColor(UIColor(named: "customPurple"), for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)

        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        loginButton.pinBottom(to: view.bottomAnchor, AuthConstants.loginButtonBottom)
        loginButton.pinCenterX(to: view.centerXAnchor)
        loginButton.setHeight(25)
        loginButton.setWidth(70)
    }
}
