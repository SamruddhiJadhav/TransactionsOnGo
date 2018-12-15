//
//  TransactionListInteractor.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 08/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class TransactionListInteractor: TransactionListInteractorProtocol {
    
    // MARK: - TransactionListInteractorProtocol Variables
    var presenter: TransactionListPresenterProtocol?
    var transactionService: TransactionServicesProtocol?
    
    // MARK: - TransactionListInteractorProtocol Method
    func getTransactions(completion: @escaping ([Transaction]) -> Void, onError: @escaping FailureHandler) {
        transactionService?.getTransactions { (responseDictonary, error) in
            var transactions: [Transaction] = []
            guard let dict = responseDictonary,
                !dict.isEmpty else {
                print("Error: Failure in Interactor")
                onError(error.debugDescription)
                return
            }
            
            guard let transactionsJson = dict["transactions"] as? [[String: Any]] else {
                completion([])
                return
            }
            transactions = transactionsJson.map({ Transaction($0) })
            print("Success: Success in Interactor")
            completion(transactions)
        }
    }
}
