//
//  SignInProtocol.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

typealias FailureHandler = (_ errorMessage: String) -> Void

protocol SignInViewProtocol {
    var presenter: SignInPresenterProtocol? { get set }
    
}

protocol SignInWireframeProtocol {
    var presenter: SignInPresenterProtocol? { get set }
    
    static func presentSignInModule(inWindow window: UIWindow)
    func presentTransactionListModule(_ transactions: [Transaction]?)
}

protocol SignInPresenterProtocol {
    var view: SignInViewProtocol? { get set }
    var interactor: SignInInteractorProtocol? { get set }
    var wireframe: SignInWireframeProtocol? { get set }
    
    func logInButtonClicked(_ username: String?, _ password: String?)
}

protocol SignInInteractorProtocol {
    var presenter: SignInPresenterProtocol? { get set }
    
    func authenticateUser(_ username: String?, _ password: String?) -> Bool
    func getTransactions(completion: @escaping ([Transaction]) -> Void, onError: @escaping FailureHandler)
}
