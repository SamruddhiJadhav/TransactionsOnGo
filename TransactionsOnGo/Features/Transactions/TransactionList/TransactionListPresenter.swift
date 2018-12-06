//
//  TransactionListPresenter.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class TransactionListPresenter: TransactionListPresenterProtocol {
    var view: TransactionListViewProtocol?
    var wireframe: TransactionListWireframeProtocol?
    
    var transactions: [Transaction]?
    
    func didSelectTransactionRow(_ transaction: Transaction) {
        wireframe?.presentTransactionDetailModule(transaction)
    }
}
