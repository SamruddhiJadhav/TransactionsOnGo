//
//  TransactionDetailWireframe.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class TransactionDetailWireframe: TransactionDetailWireframeProtocol {
    var presenter: TransactionDetailPresenterProtocol?
    
    static func presentTransactionDetailModule(fromView vc: UIViewController, _ transaction: Transaction) {
        let view = TransactionDetailWireframe.instantiate()
        let presenter = TransactionDetailPresenter()
        let wireframe = TransactionDetailWireframe()
        
        view.presenter = presenter
        presenter.wireframe = wireframe
        presenter.view = view
        presenter.transaction = transaction
        vc.navigationController?.pushViewController(view, animated: true)
    }
    
    static func instantiate() -> TransactionDetailView {
        guard let view = UIStoryboard(name: "Transactions", bundle: nil).instantiateViewController(withIdentifier: "TransactionDetailView") as? TransactionDetailView else {
            fatalError("Failed to initaite!")
        }
        return view
    }
}
