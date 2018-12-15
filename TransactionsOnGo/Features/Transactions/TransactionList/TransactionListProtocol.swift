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
    
    func showErrorMessage(_ message: String)
    func reloadTableView()
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

protocol TransactionListWireframeProtocol {
    var presenter: TransactionListPresenterProtocol? { get set }
    
    static func presentTransactionListModule(fromView vc: UIViewController)
    func presentTransactionDetailModule(_ transaction: Transaction)
    func popViewController()
}

protocol TransactionListPresenterProtocol {
    var view: TransactionListViewProtocol? { get set }
    var wireframe: TransactionListWireframeProtocol? { get set }
    var interactor: TransactionListInteractorProtocol? { get set }
    
    var transactions: [Transaction]? { get set }
    
    func viewDidLoad()
    func okButtonClicked()
    func didSelectTransactionRow(_ transaction: Transaction)
}

protocol TransactionListInteractorProtocol {
    var presenter: TransactionListPresenterProtocol? { get set }
    
    func getTransactions(completion: @escaping ([Transaction]) -> Void, onError: @escaping FailureHandler)
}

protocol  TransactionServicesProtocol {
    func getTransactions(completion: @escaping ([String: Any]?, Error?) -> Void)
}
