//
//  SignInInteractor.swift
//  TransactionsOnGo
//
//  Created by Jadhav, Samruddhi on 05/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

import Foundation

class SignInInteractor: SignInInteractorProtocol {
    var presenter: SignInPresenterProtocol?
    
    func authenticateUser(_ username: String?, _ password: String?) -> Bool {
        if username == "a" && password == "a" {
            return true
        }
        return false
    }
    
    func getTransactions(completion: @escaping ([Transaction]) -> Void, onError: @escaping FailureHandler) {
        
        TransactionServices.getTransactions { (responseDictonary, error) in
            var transactions: [Transaction] = []
            if let dict = responseDictonary, !dict.isEmpty {
                if let transactionsJson = dict["transactions"] as? [[String: Any]] {
                    transactions = transactionsJson.map({ Transaction($0) })
                    completion(transactions)
                } else {
                    completion([])
                }
            } else {
               onError("Sorry message")
            }
        }
    }
}
