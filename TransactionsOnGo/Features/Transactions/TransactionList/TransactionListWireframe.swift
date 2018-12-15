//
//  TransactionListWireframe.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class TransactionListWireframe: TransactionListWireframeProtocol {
    
    // MARK: - TransactionListWireframeProtocol Variable
    var presenter: TransactionListPresenterProtocol?
    
    // MARK: - TransactionListWireframe Constants
    static let STORYBOARD_ID = "Transactions"
    static let STORYBOARD_VIEW_ID = "TransactionListView"
    
    // MARK: - TransactionListWireframeProtocol Methods
    static func presentTransactionListModule(fromView vc: UIViewController) {
        let view: TransactionListView = StoryboardUtil.instantiateView(TransactionListWireframe.STORYBOARD_ID,
                                                                       TransactionListWireframe.STORYBOARD_VIEW_ID)
        let presenter = TransactionListPresenter()
        let wireframe = TransactionListWireframe()
        let interactor = TransactionListInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        wireframe.presenter = presenter
        
        interactor.transactionService = TransactionServices()
        
        vc.navigationController?.pushViewController(view, animated: true)
    }
    
    func presentTransactionDetailModule(_ transaction: Transaction) {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        TransactionDetailWireframe.presentTransactionDetailModule(fromView: view,
                                                                  transaction)
    }
    
    func popViewController() {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        view.navigationController?.popViewController(animated: true)
    }
}
