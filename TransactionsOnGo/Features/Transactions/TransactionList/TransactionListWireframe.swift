//
//  TransactionListWireframe.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class TransactionListWireframe: TransactionListWireframeProtocol {
    var presenter: TransactionListPresenterProtocol?
    
    static func presentTransactionListModule(fromView vc: UIViewController, _ transactions: [Transaction]) {
        let view = TransactionListWireframe.instantiate()
        let presenter = TransactionListPresenter()
        let wireframe = TransactionListWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        wireframe.presenter = presenter
        
        presenter.transactions = transactions
        
        vc.navigationController?.pushViewController(view, animated: true)
    }
    
    func presentTransactionDetailModule(_ transaction: Transaction) {
        guard let view = presenter?.view as? UIViewController else {
            return
        }
        TransactionDetailWireframe.presentTransactionDetailModule(fromView: view, transaction)
    }
    
    static func instantiate() -> TransactionListView {
        guard let view = UIStoryboard(name: "Transactions", bundle: nil).instantiateViewController(withIdentifier: "TransactionListView") as? TransactionListView else {
            fatalError("Failed to initaite!")
        }
        return view
    }
}
