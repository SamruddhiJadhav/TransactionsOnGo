//
//  TrasactionListInteractorMock.swift
//  TransactionsOnGoTests
//
//  Created by Jadhav, Samruddhi on 09/12/18.
//  Copyright © 2018 Jadhav, Samruddhi. All rights reserved.
//

@testable import TransactionsOnGo
import XCTest

class TransactionListInteractorMock: TransactionListInteractorProtocol {
    var presenter: TransactionListPresenterProtocol?
    
    var isNegativeTestCase = false
    
    func getTransactions(completion: @escaping ([Transaction]) -> Void, onError: @escaping FailureHandler) {
        if isNegativeTestCase {
            onError("Error")
        } else {
            
            let transactionsJson = [["transactionId": "ACRAF23DB3C4",
                                         "beneficiary": "Brother",
                                         "date": "20/02/2018",
                                         "amountSent": "200 GBP",
                                         "amountReceived" : "17,966.61 INR",
                                         "rate": "90.50733 GBP",
                                         "timeTaken": "3 mins",
                                         "fee": "- 1.49 GBP",
                                         "savedAmount": "19.79 GBP"]]
            
            let transactionsList = transactionsJson.map({ Transaction($0) })
            completion(transactionsList)
        }
    }
}
