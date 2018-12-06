//
//  TransactionListProtocol.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

protocol TransactionListViewProtocol {
    var presenter: TransactionListPresenterProtocol? { get set }
}

protocol TransactionListWireframeProtocol {
    var presenter: TransactionListPresenterProtocol? { get set }
    
    static func presentTransactionListModule(fromView vc: UIViewController, _ transactions: [Transaction])
    func presentTransactionDetailModule(_ transaction: Transaction)
}

protocol TransactionListPresenterProtocol {
    var view: TransactionListViewProtocol? { get set }
    var wireframe: TransactionListWireframeProtocol? { get set }
    var transactions: [Transaction]? { get set }
    
    func didSelectTransactionRow(_ transaction: Transaction)
}
