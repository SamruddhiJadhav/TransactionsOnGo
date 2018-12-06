//
//  SignInWireframe.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class SignInWireframe: SignInWireframeProtocol {
    var presenter: SignInPresenterProtocol?
    
    static func presentSignInModule(inWindow window: UIWindow) {
        let view = SignInWireframe.instantiate()
        let presenter = SignInPresenter()
        let interactor = SignInInteractor()
        let wireframe = SignInWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        wireframe.presenter = presenter
        
        let rootNavigationController = SignInWireframe.instantiateNavigationController()
        let signInView = view as SignInView
        rootNavigationController.viewControllers = [signInView]

        window.rootViewController = rootNavigationController
    }
    
    func presentTransactionListModule(_ transactions: [Transaction]?) {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        TransactionListWireframe.presentTransactionListModule(fromView: view, transactions!)
    }
    
    static func instantiate() -> SignInView {
        guard let view = UIStoryboard(name: "SignIn", bundle: nil).instantiateViewController(withIdentifier: "SignInView") as? SignInView else {
            fatalError("Failed to initaite!")
        }
        return view
    }
    
    static func instantiateNavigationController() -> UINavigationController {
        guard let nc = UIStoryboard(name: "SignIn", bundle: nil).instantiateViewController(withIdentifier: "navigationController") as? UINavigationController else {
            fatalError("Failed to initaite!")
        }
        return nc
    }
}
