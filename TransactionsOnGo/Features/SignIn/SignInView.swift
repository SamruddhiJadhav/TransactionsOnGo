//
//  SignInView.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class SignInView: UIViewController, SignInViewProtocol {

    // MARK: - IBOutlet Views
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    
    // MARK: - SignInViewProtocol Variable
    var presenter: SignInPresenterProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboard()
        setUpAccessibiltyIdentifiers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        passwordTextField.text = ""
        passwordTextField.resignFirstResponder()
    }
    
    // MARK: - IBAction Method
    @IBAction func signInButton(_ sender: Any) {
        presenter?.signInButtonClicked(usernameTextField.text,
                                       passwordTextField.text)
    }
    
    // MARK: - Other Methods
    
    func setUpAccessibiltyIdentifiers() {
        signInButton.accessibilityIdentifier = StringConstants.SIGN_IN_BUTTON
        usernameTextField.accessibilityIdentifier = StringConstants.USERNAME_TEXTFIELD
        passwordTextField.accessibilityIdentifier = StringConstants.PASSWORD_TEXTFIELD
    }
    
    func showErrorMessage(_ message: String) {
        let alert = UIAlertController(title: StringConstants.ERROR_TITLE,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: StringConstants.OK_LABEL,
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func setupKeyboard() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
