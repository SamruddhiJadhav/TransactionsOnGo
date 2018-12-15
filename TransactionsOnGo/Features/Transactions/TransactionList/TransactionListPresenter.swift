//
//  TransactionListPresenter.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class TransactionListPresenter: TransactionListPresenterProtocol {
    
    // MARK: - TransactionListPresenterProtocol Variable
    var view: TransactionListViewProtocol?
    var wireframe: TransactionListWireframeProtocol?
    var interactor: TransactionListInteractorProtocol?
    
    var transactions: [Transaction]?
    
    // MARK: - TransactionListPresenterProtocol Methods
    func viewDidLoad() {
        view?.showLoadingIndicator()
        getTransactions()
    }
    
    func didSelectTransactionRow(_ transaction: Transaction) {
        wireframe?.presentTransactionDetailModule(transaction)
    }
    
    func okButtonClicked() {
        wireframe?.popViewController()
    }
    
    // MARK: - Helper Methods
    func getTransactions() {
        interactor?.getTransactions(completion: { [weak self] (transactions) in
            if !transactions.isEmpty {
                self?.transactions = transactions.filter({ $0.beneficiary != nil })
                
                guard let transactions = self?.transactions, !transactions.isEmpty else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.view?.reloadTableView()
                }
            } else {
                print("Error: Transactions are empty.")
                self?.view?.hideLoadingIndicator()
                self?.view?.showErrorMessage(StringConstants.GENERIC_ERROR_MESSAGE)
            }
        }, onError: { [weak self] (error) in
            print("Error: API call failure.")
            self?.view?.hideLoadingIndicator()
            self?.view?.showErrorMessage(StringConstants.GENERIC_ERROR_MESSAGE)
        })
    }
}
