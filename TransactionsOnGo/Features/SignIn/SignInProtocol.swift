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
    
    func showErrorMessage(_ message: String)
}

protocol SignInWireframeProtocol {
    var presenter: SignInPresenterProtocol? { get set }
    
    static func presentSignInModule(inWindow window: UIWindow)
    func presentTransactionListModule()
}

protocol SignInPresenterProtocol {
    var view: SignInViewProtocol? { get set }
    var wireframe: SignInWireframeProtocol? { get set }
    
    func signInButtonClicked(_ username: String?, _ password: String?)
}
