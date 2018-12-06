//
//  SignInPresenter.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class SignInPresenter: SignInPresenterProtocol {
    var view: SignInViewProtocol?
    var interactor: SignInInteractorProtocol?
    var wireframe: SignInWireframeProtocol?
 
    var transactions: [Transaction]?
    
    func logInButtonClicked(_ username: String?, _ password: String?) {
        if let isAuthenticated = interactor?.authenticateUser (username, password), isAuthenticated {
            interactor?.getTransactions(completion: { [weak self] (transactions) in
                DispatchQueue.main.async {
                    self?.wireframe?.presentTransactionListModule(transactions)
                }
            }, onError: { (error) in
                    print(error)
            })
        } else {
            print("error: LogIn failed")
        }
    }
}
