import Foundation
import UIKit

final class RegistrationViewController: UIViewController, UITextFieldDelegate {
    var presenter: RegistrationPresenter?
    
    private let mainLabel: UILabel = UILabel()
    private let emailField: UITextField = UITextField()
    private let passwordField: UITextField = UITextField()
    private let secondPasswordField: UITextField = UITextField()
    
    private let signUpButton: UIButton = UIButton(type: .system)
    
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
    private func signUpButtonTapped() {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        guard let secondPassword = secondPasswordField.text else { return }
        
        presenter?.signUpButtonTapped(email: email, password: password, secondPassword: secondPassword)
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
}

// MARK: - UI Configuration
extension RegistrationViewController {
    private func configureUI() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        
        configureBackButton()
        configureMainLabel()
        configureEmailField()
        configurePassField()
        configureSecondPassField()
        configureSignUpButton()
    }
    
    private func configureBackButton() {
        let largeFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let image = UIImage(systemName: "chevron.left", withConfiguration: configuration)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func configureMainLabel() {
        view.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mainLabel.text = "Registration"
        mainLabel.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        
        mainLabel.pinTop(to: view.topAnchor, AuthConstants.labelTop)
        mainLabel.pinCenterX(to: view.centerXAnchor)
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
        emailField.pinTop(to: mainLabel.bottomAnchor, 30)
        emailField.pinCenterX(to: view.centerXAnchor)
    }
    
    
    private func configurePassField() {
        view.addSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordField.isSecureTextEntry = true 
        passwordField.delegate = self
        
        passwordField.backgroundColor = .systemGray6
        passwordField.placeholder = "Create password"
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
        passwordField.pinTop(to: mainLabel.bottomAnchor, 90)
        passwordField.pinCenterX(to: view.centerXAnchor)
    }
    
    private func configureSecondPassField() {
        view.addSubview(secondPasswordField)
        secondPasswordField.translatesAutoresizingMaskIntoConstraints = false
        
        secondPasswordField.isSecureTextEntry = true
        secondPasswordField.delegate = self
        
        secondPasswordField.backgroundColor = .systemGray6
        secondPasswordField.placeholder = "Repeat your password"
        secondPasswordField.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        secondPasswordField.layer.cornerRadius = 15
        secondPasswordField.returnKeyType = .done
        
        secondPasswordField.autocapitalizationType = .none
        secondPasswordField.autocorrectionType = .no
        secondPasswordField.keyboardType = .emailAddress
        
        secondPasswordField.leftView = UIView(frame: CGRect(x: .zero, y: .zero, width: 20, height: 50))
        secondPasswordField.rightView = UIView(frame: CGRect(x: .zero, y: .zero, width: 20, height: 50))
        secondPasswordField.leftViewMode = .always
        secondPasswordField.rightViewMode = .always
        
        secondPasswordField.setWidth(350)
        secondPasswordField.setHeight(50)
        secondPasswordField.pinTop(to: mainLabel.bottomAnchor, 150)
        secondPasswordField.pinCenterX(to: view.centerXAnchor)
    }
    
    private func configureSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor(named: "customPurple"), for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        signUpButton.layer.borderColor = UIColor(named: "customPurple")?.cgColor
        signUpButton.layer.borderWidth = 4
        signUpButton.layer.cornerRadius = 30
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        signUpButton.pinBottom(to: view.bottomAnchor, AuthConstants.signInButtonBottom)
        signUpButton.pinCenterX(to: view.centerXAnchor)
        signUpButton.setHeight(60)
        signUpButton.setWidth(200)
    }
}

extension RegistrationViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
