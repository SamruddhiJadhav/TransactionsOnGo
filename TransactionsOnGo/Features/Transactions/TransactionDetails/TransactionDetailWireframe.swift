//
//  TransactionDetailWireframe.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class TransactionDetailWireframe: TransactionDetailWireframeProtocol {
    
    // MARK: - TransactionDetailWireframeProtocol Variable
    var presenter: TransactionDetailPresenterProtocol?
    
    // MARK: - TransactionDetailWireframe Constants
    static let STORYBOARD_ID = "Transactions"
    static let STORYBOARD_VIEW_ID = "TransactionDetailView"
    
    // MARK: - TransactionDetailWireframeProtocol Method
    static func presentTransactionDetailModule(fromView vc: UIViewController, _ transaction: Transaction) {
        let view: TransactionDetailView = StoryboardUtil.instantiateView(TransactionDetailWireframe.STORYBOARD_ID,
                                                                         TransactionDetailWireframe.STORYBOARD_VIEW_ID)
        let presenter = TransactionDetailPresenter()
        let wireframe = TransactionDetailWireframe()
        
        presenter.wireframe = wireframe
        presenter.view = view
        view.presenter = presenter
        presenter.transaction = transaction
        
        vc.navigationController?.pushViewController(view, animated: true)
    }
}
