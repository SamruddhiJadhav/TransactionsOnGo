//
//  SignInView.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class SignInView: UIViewController, SignInViewProtocol {
    var presenter: SignInPresenterProtocol?
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func logInButton(_ sender: Any) {
        presenter?.logInButtonClicked(usernameTextField.text, passwordTextField.text)
    }
    
}
