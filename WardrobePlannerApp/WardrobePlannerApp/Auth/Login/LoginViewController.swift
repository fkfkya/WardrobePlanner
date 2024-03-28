import Foundation
import UIKit

final class LoginViewController: UIViewController, UITextFieldDelegate {
    var presenter: LoginPresenter?
    
    private let loginLabel: UILabel = UILabel()
    private let emailField: UITextField = UITextField()
    private let passwordField: UITextField = UITextField()
    
    private let forgotPasswordButton: UIButton = UIButton(type: .system)
    private let loginButton: UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        configureUI()
    }
    
    // MARK: - View To Presenter
    @objc
    private func backButtonTapped() {
        presenter?.backButtonTapped()
    }
    
    @objc
    private func forgotPasswordButtonTapped() {
        guard let email = emailField.text, !email.isEmpty else {
            showAlert(message: "Please enter your email")
            return
        }
                
        presenter?.forgotPasswordButtonTapped(email: email)
    }
    
    @objc
    private func loginButtonTapped() {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        presenter?.loginButtonTapped(email: email, password: password)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showLoadingView() {
        let loadingView = UIView(frame: view.bounds)
        loadingView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.center = loadingView.center
        loadingView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        view.addSubview(loadingView)
        loadingView.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = false
    }
    
    func hideLoadingView() {
        view.subviews.first(where: { $0.backgroundColor == UIColor(white: 0, alpha: 0.3) })?.removeFromSuperview()
        view.isUserInteractionEnabled = true
    }
    
    func setEmailTextField(email: String) {
        emailField.text = email
    }

}

// MARK: - UI Configuration
extension LoginViewController {
    private func configureUI() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        
        configureBackButton()
        configureLoginLabel()
        configureEmailField()
        configurePassField()
        configureLoginButton()
        configureForgotPasswordButton()
    }
    
    private func configureBackButton() {
        let largeFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let image = UIImage(systemName: "chevron.left", withConfiguration: configuration)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func configureLoginLabel() {
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loginLabel.text = "Login"
        loginLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        
        loginLabel.pinTop(to: view.topAnchor, AuthConstants.labelTop)
        loginLabel.pinCenterX(to: view.centerXAnchor)
    }
    
    private func configureEmailField() {
        view.addSubview(emailField)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.delegate = self
        
        emailField.backgroundColor = .systemGray6
        emailField.placeholder = "username@email.com"
        emailField.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        emailField.layer.cornerRadius = 15
        emailField.returnKeyType = .done
        
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.keyboardType = .emailAddress
        
        emailField.leftView = UIView(frame: CGRect(x: .zero, y: .zero, width: 20, height: 50))
        emailField.rightView = UIView(frame: CGRect(x: .zero, y: .zero, width: 20, height: 50))
        emailField.leftViewMode = .always
        emailField.rightViewMode = .always
        
        emailField.setWidth(350)
        emailField.setHeight(50)
        emailField.pinTop(to: loginLabel.bottomAnchor, 30)
        emailField.pinCenterX(to: view.centerXAnchor)
    }
    
    
    private func configurePassField() {
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordField.isSecureTextEntry = true
        
        passwordField.delegate = self
        
        passwordField.backgroundColor = .systemGray6
        passwordField.placeholder = "Password"
        passwordField.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        passwordField.layer.cornerRadius = 15
        passwordField.returnKeyType = .done
        
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.keyboardType = .emailAddress
        
        passwordField.leftView = UIView(frame: CGRect(x: .zero, y: .zero, width: 20, height: 50))
        passwordField.rightView = UIView(frame: CGRect(x: .zero, y: .zero, width: 20, height: 50))
        passwordField.leftViewMode = .always
        passwordField.rightViewMode = .always
        
        passwordField.setWidth(350)
        passwordField.setHeight(50)
        passwordField.pinTop(to: loginLabel.bottomAnchor, 90)
        passwordField.pinCenterX(to: view.centerXAnchor)
    }
    
    private func configureForgotPasswordButton() {
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPasswordButton.setTitle("Forgot Password", for: .normal)
        forgotPasswordButton.setTitleColor(UIColor(named: "customPurple"), for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        
        forgotPasswordButton.pinBottom(to: loginButton.bottomAnchor, AuthConstants.loginButtonBottom)
        forgotPasswordButton.pinCenterX(to: view.centerXAnchor)
        forgotPasswordButton.setHeight(60)
        forgotPasswordButton.setWidth(200)
    }
    
    private func configureLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.setTitleColor(UIColor(named: "customPurple"), for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        loginButton.layer.borderColor = UIColor(named: "customPurple")?.cgColor
        loginButton.layer.borderWidth = 4
        loginButton.layer.cornerRadius = 30
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        loginButton.pinBottom(to: view.bottomAnchor, AuthConstants.signInButtonBottom)
        loginButton.pinCenterX(to: view.centerXAnchor)
        loginButton.setHeight(60)
        loginButton.setWidth(200)
    }
}

extension LoginViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
