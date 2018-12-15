//
//  SignInPresenter.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class SignInPresenter: SignInPresenterProtocol {
    
    // MARK: - SignInPresenterProtocol Variables
    var view: SignInViewProtocol?
    var wireframe: SignInWireframeProtocol?
    
    // MARK: - SignInPresenterProtocol method
    func signInButtonClicked(_ username: String?, _ password: String?) {
        if isValidUser(username, password) {
            wireframe?.presentTransactionListModule()
            print("Success: Signed In")
        } else {
            print("Error: Sign In failed")
            view?.showErrorMessage(StringConstants.INCORRECT_USERNAME_OR_PASSWORD)
        }
    }
    
    // MARK: - Helper Method
    func isValidUser(_ username: String?, _ password: String?) -> Bool {
        return username == "user" && password == "pass"
    }
}
